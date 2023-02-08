#SingleInstance force
#NoEnv
#MaxThreadsPerHotkey 2
CoordMode, Mouse, Screen
SendMode, Input
toggle = 0
toggle2 = 0
toggle3 = 0
pos1x := 0
pos1y := 0

pos2x := 0
pos2y := 0
pos3x := 0
pos3y := 0

bluestacks := "MIRMG(2) ahk_exe MIRMG-Win64-Shipping.exe"
fishingMirm := "MIRMG(2)"
mirmPID := "33608"

WinGet, mirmPID, PID, %fishingMirm%

Gui, New
Gui, Add, Text,, MIRMG(2) mirmPID
Gui, Add, Edit, vmirmPID w100, % mirmPID
Gui, Add, Button, gAutoSetPID, Auto Set PID
Gui, Add, Text,, Press F1 for rod position 1
Gui, Add, Edit, vpos1x w100, % pos1x
Gui, Add, Edit, vpos1y w100, % pos1y

Gui, Add, Text,, Press F2 for rod position 2
Gui, Add, Edit, vpos2x w100, % pos2x
Gui, Add, Edit, vpos2y w100, % pos2y


Gui, Add, Text,, Press F3 for rod position 3
Gui, Add, Edit, vpos3x w100, % pos3x
Gui, Add, Edit, vpos3y w100, % pos3y

Gui, Add, Button, gApplyCoordinates, Apply Coordinates
Gui, Add, Button, Default gOK, OK
Gui, Show, w200
return
OK:
Gui, Submit
return

AutoSetPID:
WinGet, mirmPID, PID, %fishingMirm%
MsgBox, PID updated!
GuiControl,,mirmPID, %mirmPID%
return


ApplyCoordinates:
GuiControl,,pos1x, %pos1x%
GuiControl,,pos1y, %pos1y%

GuiControl,,pos2x, %pos2x%
GuiControl,,pos2y, %pos2y%

GuiControl,,pos3x, %pos3x%
GuiControl,,pos3y, %pos3y%
return

*F1::
{
	
	if WinExist(fishingMirm) {
		MouseGetPos, pos1x, pos1y 
		MsgBox, The pos1 is saved at X%pos1x% Y%pos1y%.
	}
	
Return
}

*F2::
{
	
	if WinExist(fishingMirm) {
		MouseGetPos, pos2x, pos2y 
		MsgBox, The pos2 is saved at X%pos2x% Y%pos2y%.
	}
	
Return
}

*F3::
{
	
	if WinExist(fishingMirm) {
		MouseGetPos, pos3x, pos3y 
		MsgBox, The pos3 is saved at X%pos3x% Y%pos3y%.
	}
	
Return
}

*F4::
{
	
	toggle := !toggle
	
	ifEqual, toggle, 1
	{
		toggle := !toggle

           	Loop, 3
           	{
				ControlClick, % "x" pos1x " y" pos1y, %fishingMirm%
				
		MsgBox, % "x" pos1x " y" pos1y
				Sleep, 1000
         	}
		
		toggle := !toggle
		
	}
Return
}
