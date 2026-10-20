from pathlib import Path
import argparse, zipfile, hashlib, json, struct, shutil, re

def main():
    root=Path(__file__).resolve().parents[1]
    ap=argparse.ArgumentParser(description="Build the SF2 Remake standalone package from an editable game folder.")
    ap.add_argument("--game",type=Path,default=root/"game")
    ap.add_argument("--launcher",type=Path,default=root/"build/Launcher.exe")
    ap.add_argument("--out",type=Path,default=root/"dist")
    args=ap.parse_args();source=args.game.resolve();launcher=args.launcher.resolve();out=args.out.resolve()
    if not launcher.is_file():ap.error("Compile launcher/Launcher.cs with tools/build_launcher.ps1 first.")
    engine=next((p for p in [source/"Ikemen_GO.exe",source/"Super Street Fighter Turbo Remake.exe"] if p.is_file()),None)
    if engine is None:ap.error("Native engine missing. Extract the published game and copy its files to --game first.")
    if source==out or source in out.parents:ap.error("Output directory must be outside the game folder.")
    out.mkdir(parents=True,exist_ok=True);payload=out/"game.zip";files={}
    with zipfile.ZipFile(payload,"w",zipfile.ZIP_DEFLATED,compresslevel=3,allowZip64=True) as z:
        for p in sorted(source.rglob("*")):
            if not p.is_file():continue
            rel=p.relative_to(source);name=p.name.lower()
            if name.endswith((".log",".bak")) or re.fullmatch(r"ikemen\d+\.png",name):continue
            if name in ["playback.done","playback.cancel","playback-test.txt","window-test.txt","verify.lua","package-integrity.txt","pacote-pronto.txt","reparos-do-pacote.txt","verificacao-erro.txt"]:continue
            if any(part.startswith("backup-") for part in rel.parts) or "replays" in rel.parts:continue
            target="Ikemen_GO.exe" if p==engine else rel.as_posix()
            z.write(p,target);files[target]={"size":p.stat().st_size,"sha256":hashlib.sha256(p.read_bytes()).hexdigest()}
        lines=[f"{v['sha256']}\t{v['size']}\t{name}" for name,v in sorted(files.items()) if not name.lower().startswith("save/")]
        integrity=("\n".join(lines)+"\n").encode("utf-8");z.writestr("package-integrity.txt",integrity)
        files["package-integrity.txt"]={"size":len(integrity),"sha256":hashlib.sha256(integrity).hexdigest()}
    identity=hashlib.sha256(json.dumps(files,sort_keys=True).encode()).digest()[:8]
    exe=out/"Super Street Fighter Turbo Remake.exe"
    with exe.open("wb") as dest:
        with launcher.open("rb") as src:shutil.copyfileobj(src,dest)
        offset=dest.tell()
        with payload.open("rb") as src:shutil.copyfileobj(src,dest)
        dest.write(struct.pack("<8sqq8s",b"SF2PACK1",offset,payload.stat().st_size,identity))
    (out/"manifest.json").write_text(json.dumps({"files":files,"build_id":f"{int.from_bytes(identity,'little'):016x}","exe":exe.name},ensure_ascii=False,indent=2),encoding="utf-8")
    print(exe)
if __name__=="__main__":main()
