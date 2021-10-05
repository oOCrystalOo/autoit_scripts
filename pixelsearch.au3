#include <GDIPlus.au3>

$sv_ImageSource = @ScriptDir & "\touch-to-start.JPG"
$iPosX = 253
$iPosY = 291

_GDIPlus_Startup()

$hImage = _GDIPlus_ImageLoadFromFile($sv_ImageSource)
$imageWidth = _GDIPlus_ImageGetWidth ( $hImage )
$imageHeight = _GDIPlus_ImageGetHeight ( $hImage )
ConsoleWrite( $imageWidth & ", " & $imageHeight & @CRLF )

;~ MsgBox(0, "Pixel Color", _GDIPlus_BitmapGetPixel($hImage, $iPosX, $iPosY))

_GDIPlus_ImageDispose($hImage)
_GDIPlus_ShutDown()