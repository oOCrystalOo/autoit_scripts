#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
$SimpleGUI = GUICreate("GUI", 281, 53, -1, -1)
$Notepad = GUICtrlCreateButton("Notepad", 8, 8, 75, 25)
$Calc = GUICtrlCreateButton("Calc", 104, 8, 75, 25)
$ExitButton = GUICtrlCreateButton("Exit", 200, 8, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Calc
			StartCalc()
		Case $Notepad
			StartNotepad()
		Case $ExitButton
			Exit
	EndSwitch
WEnd



Func StartCalc()
   Run('calc.exe')
EndFunc	 ;==> start calculator

Func StartNotepad()
   Run('notepad.exe')
EndFunc