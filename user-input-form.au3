#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Form1", 210, 228, 312, 283)
Global $UserInput = GUICtrlCreateEdit("", 8, 8, 193, 169)
Global $SaveBtn = GUICtrlCreateButton("Save", 8, 192, 75, 25)
Global $DefaultBtn = GUICtrlCreateButton("Default", 128, 192, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $SaveBtn
			$data = GUICtrlRead($UserInput)
			$saveLocation = FileSaveDialog('Save file', @ScriptDir, 'Text Files (*.txt)', 16)
			FileWrite($saveLocation, $data)

		Case $DefaultBtn
			GUICtrlSetData($UserInput, 'Some default info')
	EndSwitch
WEnd
