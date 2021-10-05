#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Global $dllpath = @ScriptDir & "\searchImage\ImageSearchDLL.dll"
#include <String.au3>
#include <WinAPIProc.au3>
#include <WinAPISysWin.au3>
#include <WinAPIFiles.au3>
#include <GDIPlus.au3>
#include <Array.au3>
#include <ScreenCapture.au3>

#include "searchImage\ImageSearch.au3"

Local $gameName = "com.bandainamcoent.digimon_rearise_ww"
Local $noxPath  = "C:\Program Files (x86)\Nox\bin\Nox.exe"
Local $windowName = "NoxPlayer"
$wHandle = WinGetHandle( $windowName )
$sv_ImageSource = @ScriptDir & "\images\touch-to-start.JPG"
$wSize = WinGetClientSize($windowName)
Local $x, $y

Func searchImage()
	Local $hBitmap = _ScreenCapture_CaptureWnd( '', $wHandle, 0, 0, $wSize[0], $wSize[1], False )
	;$result = DllCall($dllpath, "str", "ImageSearchEx", "int", 691, "int", 349, "int", 1977, "int", 355, "str", $sv_ImageSource, "ptr", $hBitmap)
	$result = _ImageSearchArea( $sv_ImageSource,1,691,349,1977,355, $x, $y, 90, $hBitmap )
	Return $result
EndFunc

If FileExists( $sv_ImageSource ) Then
	_GDIPlus_Startup()
	$hImage = _GDIPlus_ImageLoadFromFile( $sv_ImageSource )
	$imageWidth = _GDIPlus_ImageGetWidth ( $hImage )
	$imageHeight = _GDIPlus_ImageGetHeight ( $hImage )

	If $imageWidth > 0 And $imageHeight > 0 Then
		$result = 0
		Do
			$result = searchImage()
			ConsoleWrite( $result & @CRLF )
		Until $result <> 0
	EndIf

	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_ShutDown()
EndIf