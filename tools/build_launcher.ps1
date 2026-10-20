$ErrorActionPreference='Stop'
$projectRoot=Split-Path -Parent $PSScriptRoot
$buildDir=Join-Path $projectRoot 'build'
New-Item -ItemType Directory -Path $buildDir -Force | Out-Null
$candidates=@((Join-Path $env:WINDIR 'Microsoft.NET/Framework64/v4.0.30319/csc.exe'),(Join-Path $env:WINDIR 'Microsoft.NET/Framework/v4.0.30319/csc.exe'))
$compiler=$candidates | Where-Object {Test-Path -LiteralPath $_} | Select-Object -First 1
if(-not $compiler){throw '.NET Framework 4 C# compiler not found.'}
Push-Location (Join-Path $projectRoot 'launcher')
try {
 & $compiler /nologo /target:winexe /optimize+ (('/out:')+(Join-Path $buildDir 'Launcher.exe')) /reference:System.Windows.Forms.dll /reference:System.Drawing.dll /reference:System.IO.Compression.dll /reference:System.IO.Compression.FileSystem.dll Launcher.cs
 if($LASTEXITCODE -ne 0){throw 'Launcher compilation failed.'}
} finally {Pop-Location}
