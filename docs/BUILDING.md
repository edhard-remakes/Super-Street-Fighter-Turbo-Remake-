# Super Street Fighter Turbo Remake — projeto editável v0.1.0

Este repositório reúne o código e os arquivos editáveis da versão pública v0.1.0: scripts Lua do menu e da interface, lógica de personagens (CNS/ST/CMD), animações AIR, definições de cenários DEF, scripts ZSS, shaders, paletas e código C# do launcher. Inclui um empacotador portátil em Python.

## Recursos gráficos e engine

Os arquivos grandes (sprites SFF, sons SND, músicas, vídeos, fontes e executável nativo da engine) continuam no EXE do jogo publicado no release. O checkout dos fontes não é um download completo e independente do jogo. Saves, estatísticas pessoais, replays e arquivos temporários não fazem parte deste pacote.

O código Go da engine IKEMEN GO é uma dependência externa, disponível em https://github.com/ikemen-engine/Ikemen-GO . Os scripts distribuídos com esta versão identificam a base como v0.98.1. Este pacote fornece o código do projeto e do launcher, não uma reconstrução do código Go do binário da engine.

## Preparar uma cópia para editar

1. Baixe o executável em https://github.com/edhard-remakes/Super-Street-Fighter-Turbo-Remake-/releases/tag/v0.1.0 .
2. Clone a branch `main` deste repositório para uma pasta de trabalho:

```powershell
git clone https://github.com/edhard-remakes/Super-Street-Fighter-Turbo-Remake-.git
cd Super-Street-Fighter-Turbo-Remake-
```
3. No PowerShell, execute o EXE com `--extract-only`, por exemplo:

```powershell
& '.\Super.Street.Fighter.Turbo.Remake.exe' --extract-only
```

4. Para o EXE original da v0.1.0, os arquivos são preparados em `%LOCALAPPDATA%\SF2Remake\versoes\c2a266c2001e4111`. Copie todo o conteúdo dessa pasta para uma nova pasta `runtime/` na raiz do checkout, preservando `game/` como os fontes versionados.
5. Sobreponha os fontes versionados à cópia completa com `robocopy .\game .\runtime /E`. Os códigos de saída de 0 a 7 do Robocopy indicam sucesso. Repita essa cópia após editar os fontes para testar as alterações.
6. Para jogar a cópia editável, execute `runtime/Ikemen_GO.exe` com o diretório de trabalho em `runtime/`.

**Edite sua cópia de trabalho, não a pasta de execução em AppData:** o launcher verifica essa pasta e pode restaurar arquivos alterados.

## Onde editar

- `game/chars/`: lógica, comandos, definições e animações dos personagens.
- `game/stages/`: definições dos cenários.
- `game/data/ssf2hd/`: menu e apresentação personalizados.
- `game/data/fight.def`: HUD.
- `game/external/script/`: scripts da base IKEMEN usados pelo projeto.
- `launcher/Launcher.cs`: preparação, verificação de integridade e inicialização do jogo.
- `tools/`: compilação do launcher e criação do EXE distribuível.

Os nomes japoneses e ocidentais diferem em alguns arquivos: `ssf2x_vega` é o espanhol de garra; `ssf2x_mbison` é o chefe de uniforme vermelho.

## Gerar o executável único

Requisitos: Windows, Python 3 e compilador C# do .NET Framework 4 instalado. A pasta `runtime/` precisa conter todos os recursos, a engine nativa e os fontes atualizados conforme os passos acima.

```powershell
.\tools\build_launcher.ps1
python .\tools\build_package.py --game .\runtime
```

O resultado fica em `dist/Super Street Fighter Turbo Remake.exe`. O empacotador também aceita `--game`, `--launcher` e `--out`. O launcher recompilado e o ZIP podem ter bytes diferentes do release original por causa da compilação e dos metadados do ZIP; o checksum do release identifica somente o EXE publicado originalmente.

## Integridade e contribuição

O EXE público original tem SHA-256 `3205ea289de356a737538873d799e22920ec854115a913fc36cabe7186d7df00`.

`SOURCE-MANIFEST.json` lista os arquivos textuais e paletas copiados da compilação e seus hashes. A configuração distribuída remove endereços IP salvos; estatísticas e replays não são incluídos.

Relate problemas ou sugestões em https://github.com/edhard-remakes/Super-Street-Fighter-Turbo-Remake-/issues . Informe o personagem, comando e passos para reproduzir.

## Créditos e licenças

Preservados `game/License.txt`, `game/ScreenpackLicense.txt` e os créditos nos arquivos. As licenças da engine e dos scripts não transferem automaticamente direitos sobre personagens, imagens, músicas, vozes ou recursos de terceiros. Street Fighter pertence à Capcom e aos respectivos titulares. Projeto de fã, gratuito e sem vínculo oficial com a Capcom.
