$ErrorActionPreference='Stop'
Add-Type -AssemblyName PresentationFramework,PresentationCore,WindowsBase,System.Windows.Forms
Add-Type @'
using System;
using System.Runtime.InteropServices;
public class IntroWindowNative {
 [StructLayout(LayoutKind.Sequential)] public struct RECT {public int Left,Top,Right,Bottom;}
 [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h,out RECT r);
 [DllImport("user32.dll")] public static extern int GetWindowLong(IntPtr h,int index);
 [DllImport("user32.dll")] public static extern int SetWindowLong(IntPtr h,int index,int value);
 [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
 [DllImport("user32.dll")] public static extern bool SetProcessDPIAware();
 [DllImport("user32.dll")] public static extern bool GetClientRect(IntPtr h,out RECT r);
 [StructLayout(LayoutKind.Sequential)] public struct POINT {public int X,Y;}
 [DllImport("user32.dll")] public static extern bool ClientToScreen(IntPtr h,ref POINT p);
 [DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr h,IntPtr after,int x,int y,int w,int height,uint flags);
}
'@
[void][IntroWindowNative]::SetProcessDPIAware()
$videoFile=Join-Path $PSScriptRoot 'abertura-ryu.mp4'
$testMode=$env:SSF_VIDEO_TEST -eq '1'
$gameProcess=Get-Process -Name Ikemen_GO,'Super Street Fighter Turbo Remake' -ErrorAction SilentlyContinue | Where-Object {$_.MainWindowHandle -ne 0} | Sort-Object StartTime -Descending | Select-Object -First 1
if ($gameProcess -and -not $testMode) {
 $gameHandle=$gameProcess.MainWindowHandle
 $bounds=[Windows.Forms.Screen]::FromHandle($gameHandle).Bounds
 $style=[IntroWindowNative]::GetWindowLong($gameHandle,-16)
 [void][IntroWindowNative]::SetWindowLong($gameHandle,-16,($style -band (-bnot 0x00CF0000)))
 [void][IntroWindowNative]::SetWindowPos($gameHandle,[IntPtr]::Zero,$bounds.X,$bounds.Y,$bounds.Width,$bounds.Height,0x0064)
}
$window=New-Object Windows.Window
$window.Title='Street Fighter — Abertura'
$window.WindowStyle='None'
$window.ResizeMode='NoResize'
$window.Background='Black'
$window.Topmost=$true
$window.ShowInTaskbar=$false
$window.Width=1920;$window.Height=1080
$window.WindowStartupLocation='CenterScreen'
if ($gameProcess) {
 $rect=New-Object IntroWindowNative+RECT
 if ([IntroWindowNative]::GetWindowRect($gameProcess.MainWindowHandle,[ref]$rect)) {
  $window.WindowStartupLocation='Manual'
  $window.Left=$rect.Left;$window.Top=$rect.Top
  $window.Width=$rect.Right-$rect.Left;$window.Height=$rect.Bottom-$rect.Top
 }
}
if (-not $gameProcess) {$window.WindowState='Maximized'}
if ($testMode) {$window.Opacity=0;$window.Topmost=$false}
$media=New-Object Windows.Controls.MediaElement
$media.LoadedBehavior='Manual';$media.UnloadedBehavior='Manual';$media.Stretch='Fill'
$media.Source=[Uri]::new($videoFile)
$window.Content=$media
$script:opened=$false;$script:failure=$null
$media.Add_MediaOpened({$script:opened=$true})
$media.Add_MediaEnded({$window.Close()})
$media.Add_MediaFailed({param($sender,$eventArgs);$script:failure=$eventArgs.ErrorException.Message;$window.Close()})
$window.Add_KeyDown({param($sender,$eventArgs);if ($eventArgs.Key -in @('Escape','Return','Space')) {$window.Close()}})
$window.Add_Loaded({
 if ($gameProcess) {
  $client=New-Object IntroWindowNative+RECT
  $origin=New-Object IntroWindowNative+POINT
  [void][IntroWindowNative]::GetClientRect($gameProcess.MainWindowHandle,[ref]$client)
  [void][IntroWindowNative]::ClientToScreen($gameProcess.MainWindowHandle,[ref]$origin)
  $handle=[Windows.Interop.WindowInteropHelper]::new($window).Handle
  [void][IntroWindowNative]::SetWindowPos($handle,[IntPtr]::new(-1),$origin.X,$origin.Y,$client.Right,$client.Bottom,0x0040)
  $actual=New-Object IntroWindowNative+RECT
  [void][IntroWindowNative]::GetWindowRect($handle,[ref]$actual)
  [IO.File]::WriteAllText((Join-Path $PSScriptRoot 'window-test.txt'),("client=$($origin.X),$($origin.Y),$($client.Right),$($client.Bottom); video=$($actual.Left),$($actual.Top),$($actual.Right-$actual.Left),$($actual.Bottom-$actual.Top)"))
 }
 $media.Play()
})
$window.Add_Closed({$media.Stop()})
$timer=New-Object Windows.Threading.DispatcherTimer
$timer.Interval=[TimeSpan]::FromMilliseconds(250)
$script:elapsed=0
$timer.Add_Tick({
 $script:elapsed+=0.25
 if (Test-Path -LiteralPath (Join-Path $PSScriptRoot 'playback.cancel')) {$window.Close();return}
 if ($testMode -and $script:opened -and $media.Position.TotalSeconds -ge 2) {
  [System.IO.File]::WriteAllText((Join-Path $PSScriptRoot 'playback-test.txt'),('VIDEO_OK '+$media.NaturalVideoWidth+'x'+$media.NaturalVideoHeight+' position='+$media.Position.TotalSeconds))
  $window.Close()
 } elseif ($script:elapsed -gt 55) {$script:failure='Playback timeout';$window.Close()}
})
$timer.Start()
try {[void]$window.ShowDialog()} finally {$timer.Stop();[IO.File]::WriteAllText((Join-Path $PSScriptRoot 'playback.done'),'done')}
if ($gameProcess -and -not $testMode) {[void][IntroWindowNative]::SetForegroundWindow($gameProcess.MainWindowHandle)}
if ($script:failure) {Write-Error $script:failure;exit 1}
if ($testMode -and -not $script:opened) {exit 2}
exit 0
