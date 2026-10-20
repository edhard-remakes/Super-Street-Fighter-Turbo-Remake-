$ErrorActionPreference='Stop'
foreach ($name in @('playback.done','playback.cancel','playback-test.txt','window-test.txt')) {
 $target=Join-Path $PSScriptRoot $name
 if (Test-Path -LiteralPath $target) {Remove-Item -LiteralPath $target}
}
$scriptPath=Join-Path $PSScriptRoot 'play_intro.ps1'
$info=[Diagnostics.ProcessStartInfo]::new()
$info.FileName='powershell.exe'
$info.Arguments='-NoProfile -STA -ExecutionPolicy Bypass -WindowStyle Hidden -File "'+$scriptPath+'"'
$info.UseShellExecute=$false
$info.CreateNoWindow=$true
$info.WorkingDirectory=$PSScriptRoot
[Diagnostics.Process]::Start($info) | Out-Null
