using System;
using System.IO;
using System.IO.Compression;
using System.Diagnostics;
using System.Drawing;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Windows.Forms;

sealed class PackageStream : Stream {
    readonly Stream file; readonly long start, length; long position;
    public PackageStream(Stream file,long start,long length){this.file=file;this.start=start;this.length=length;}
    public override bool CanRead{get{return true;}} public override bool CanSeek{get{return true;}} public override bool CanWrite{get{return false;}}
    public override long Length{get{return length;}} public override long Position{get{return position;}set{Seek(value,SeekOrigin.Begin);}}
    public override int Read(byte[] buffer,int offset,int count){file.Position=start+position;int n=file.Read(buffer,offset,(int)Math.Min(count,length-position));position+=n;return n;}
    public override long Seek(long offset,SeekOrigin origin){long p=origin==SeekOrigin.Begin?offset:origin==SeekOrigin.Current?position+offset:length+offset;if(p<0||p>length)throw new IOException("Invalid package offset");return position=p;}
    public override void Flush(){} public override void SetLength(long v){throw new NotSupportedException();} public override void Write(byte[] b,int o,int c){throw new NotSupportedException();}
}
static class Launcher {
    [System.Runtime.InteropServices.DllImport("user32.dll")] static extern bool SetProcessDPIAware();
    static void DisplayConfig(){
        var size=Screen.PrimaryScreen.Bounds;
        string path=Path.Combine(gameDir,"save","config.json");
        string text=File.ReadAllText(path);
        text=System.Text.RegularExpressions.Regex.Replace(text,"(\"GameWidth\"\\s*:\\s*)[0-9]+", "${1}"+size.Width);
        text=System.Text.RegularExpressions.Regex.Replace(text,"(\"GameHeight\"\\s*:\\s*)[0-9]+", "${1}"+size.Height);
        File.WriteAllText(path,text,new UTF8Encoding(false));
    }

    static Form window; static Label message; static ProgressBar progress;
    static string buildId,gameDir;
    static void Status(string text,int value){if(window!=null&&!window.IsDisposed)window.Invoke((Action)(()=>{message.Text=text;progress.Value=Math.Max(0,Math.Min(100,value));}));}
    static bool CorrectFile(string path,string hash,long size){
        try{
            if(!File.Exists(path)||new FileInfo(path).Length!=size)return false;
            using(var input=File.OpenRead(path))using(var sha=SHA256.Create()){
                string actual=BitConverter.ToString(sha.ComputeHash(input)).Replace("-","").ToLowerInvariant();
                return actual==hash;
            }
        }catch(IOException){return false;}
    }
    static void Prepare(){
        string self=Application.ExecutablePath;
        using(var file=File.OpenRead(self)){
            if(file.Length<32)throw new IOException("Pacote incompleto.");
            file.Position=file.Length-32;var tail=new byte[32];file.Read(tail,0,32);
            if(Encoding.ASCII.GetString(tail,0,8)!="SF2PACK1")throw new IOException("Pacote inválido.");
            long start=BitConverter.ToInt64(tail,8),length=BitConverter.ToInt64(tail,16);
            buildId=BitConverter.ToUInt64(tail,24).ToString("x16");
            if(start<0||length<0||start+length!=file.Length-32)throw new IOException("Pacote incompleto.");
            gameDir=Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),"SF2Remake","versoes",buildId);
            string done=Path.Combine(gameDir,"pacote-pronto.txt");
            bool prepared=File.Exists(done);
            Directory.CreateDirectory(gameDir);string root=Path.GetFullPath(gameDir)+Path.DirectorySeparatorChar;
            using(var segment=new PackageStream(file,start,length))using(var zip=new ZipArchive(segment,ZipArchiveMode.Read)){
                var hashes=new Dictionary<string,string>();var sizes=new Dictionary<string,long>();
                var manifest=zip.GetEntry("package-integrity.txt");
                if(manifest==null)throw new IOException("Verificação do pacote ausente.");
                using(var reader=new StreamReader(manifest.Open(),Encoding.UTF8)){
                    string line;
                    while((line=reader.ReadLine())!=null){
                        var parts=line.Split(new char[]{'\t'},3);
                        if(parts.Length!=3)throw new IOException("Verificação do pacote inválida.");
                        hashes.Add(parts[2],parts[0]);sizes.Add(parts[2],long.Parse(parts[1]));
                    }
                }
                int i=0;var repaired=new List<string>();
                foreach(var entry in zip.Entries){
                    string name=entry.FullName;
                    string path=Path.GetFullPath(Path.Combine(root,name.Replace('/',Path.DirectorySeparatorChar)));
                    if(!path.StartsWith(root,StringComparison.OrdinalIgnoreCase))throw new IOException("Caminho inválido no pacote.");
                    if(name.EndsWith("/")){Directory.CreateDirectory(path);continue;}
                    bool immutable=hashes.ContainsKey(name);
                    Status(prepared?"Verificando os arquivos do jogo…":"Preparando o jogo para a primeira abertura…",++i*100/zip.Entries.Count);
                    if(immutable&&CorrectFile(path,hashes[name],sizes[name]))continue;
                    // Player settings and saved progress are intentionally mutable.
                    if(!immutable&&prepared&&File.Exists(path))continue;
                    Directory.CreateDirectory(Path.GetDirectoryName(path));
                    string temp=path+".repair-tmp";
                    using(var input=entry.Open())using(var output=File.Create(temp)){input.CopyTo(output);}
                    if(immutable&&!CorrectFile(temp,hashes[name],sizes[name])){
                        File.Delete(temp);throw new IOException("Falha na integridade: "+name);
                    }
                    File.Copy(temp,path,true);File.Delete(temp);
                    if(prepared&&immutable)repaired.Add(name);
                }
                if(repaired.Count>0)File.WriteAllLines(Path.Combine(gameDir,"reparos-do-pacote.txt"),repaired.ToArray());
            }
            File.WriteAllText(done,buildId);
        }
    }
    [STAThread] static int Main(string[] args){
        SetProcessDPIAware();Application.EnableVisualStyles();Application.SetCompatibleTextRenderingDefault(false);
        bool extractOnly=Array.IndexOf(args,"--extract-only")>=0;
        using(var mutex=new Mutex(false,"Local\\SF2RemakePackage")){
            if(!mutex.WaitOne(0)){if(!extractOnly)MessageBox.Show("O jogo já está aberto ou sendo preparado.","SF2 Remake");return 0;}
            Exception failure=null;
            window=new Form{Text="Super Street Fighter Turbo Remake",ClientSize=new Size(480,115),StartPosition=FormStartPosition.CenterScreen,FormBorderStyle=FormBorderStyle.FixedDialog,MaximizeBox=false,MinimizeBox=false,ControlBox=false,BackColor=Color.FromArgb(12,20,45)};
            message=new Label{Text="Abrindo o jogo…",ForeColor=Color.White,Left=22,Top=23,Width=438,Height=30,Font=new Font("Segoe UI",11)};
            progress=new ProgressBar{Left=22,Top=70,Width=436,Height=17};window.Controls.Add(message);window.Controls.Add(progress);
            window.Shown+=(s,e)=>Task.Run(()=>{try{Prepare();}catch(Exception ex){failure=ex;}finally{window.BeginInvoke((Action)(()=>window.Close()));}});
            Application.Run(window);
            if(failure!=null){try{File.WriteAllText(Path.Combine(gameDir??Path.GetDirectoryName(Application.ExecutablePath),"verificacao-erro.txt"),failure.ToString());}catch{} MessageBox.Show("Não foi possível preparar o jogo:\n"+failure.Message,"SF2 Remake",MessageBoxButtons.OK,MessageBoxIcon.Error);return 1;}
            if(extractOnly)return 0;
            try{
                DisplayConfig();
                var info=new ProcessStartInfo(Path.Combine(gameDir,"Ikemen_GO.exe")){WorkingDirectory=gameDir,UseShellExecute=false,CreateNoWindow=true};
                using(var game=Process.Start(info)){game.WaitForExit();return game.ExitCode;}
            }catch(Exception ex){MessageBox.Show("Não foi possível abrir o jogo:\n"+ex.Message,"SF2 Remake",MessageBoxButtons.OK,MessageBoxIcon.Error);return 1;}
        }
    }
}
