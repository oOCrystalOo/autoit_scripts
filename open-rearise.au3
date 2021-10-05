#include <String.au3>
#include <WinAPIProc.au3>
#include <WinAPISysWin.au3>
Local $gameName = "com.bandainamcoent.digimon_rearise_ww"
Local $noxPath  = "C:\Program Files (x86)\Nox\bin\Nox.exe"
Local $windowName = "NoxPlayer"
Local $iPID = WinGetProcess($windowName)
Local $sPath = _WinAPI_GetProcessFileName($iPID)
If $iPID < 0 Then $sPath = $noxPath

;If Not( ProcessExists( $noxPath ) ) Then Run( $noxPath & " -package:" & $gameName )

Local $old_aPos = WinGetPos($windowName)


Local $hTimer = TimerInit()
While ProcessExists($iPID) = True
	ProcessClose($iPID)
WEnd

Local $sRun = $sPath  & " -package:" & $gameName & " -lang:en"
ConsoleWrite("Running " & $sRun & @CRLF)
Run($sRun)

;Waiting for Nox handles to load.
$g_hWindow = 0
$g_hControl = 0

$hTimer = TimerInit()
While ($g_hWindow = 0 Or $g_hControl = 0)
	If (isArray($old_aPos)) Then _WinAPI_SetWindowPos($g_hWindow, $HWND_BOTTOM, $old_aPos[0], $old_aPos[1], -1, -1, $SWP_NOACTIVATE+$SWP_NOSIZE)
WEnd