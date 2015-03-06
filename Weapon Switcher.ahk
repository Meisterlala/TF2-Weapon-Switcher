/*
 * * * Compile_AHK SETTINGS BEGIN * * *

[AHK2EXE]
Exe_File=%In_Dir%\Weapon Switcher.exe
[ICONS]
Icon_1=%In_Dir%\icon.ico
Icon_2=%In_Dir%\icon.ico
Icon_3=%In_Dir%\icon.ico
Icon_4=%In_Dir%\icon.ico

* * * Compile_AHK SETTINGS END * * *
*/

;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Meisterlala
;
; Script Function:
;	Template script (Totlally not a template :)
;
;	http://www.network-science.de/ascii/	starwars	width=100	center
;

#SingleInstance force
#InstallMouseHook
#InstallKeybdHook
#Persistent





SetTitleMatchMode, 1 
SetTitleMatchMode, Fast
SetControlDelay 0
SetKeyDelay, 0, 30







DisableCloseButton(hWnd="") {
 If hWnd=
    hWnd:=WinExist("A")
 hSysMenu:=DllCall("GetSystemMenu","Int",hWnd,"Int",FALSE)
 nCnt:=DllCall("GetMenuItemCount","Int",hSysMenu)
 DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-1,"Uint","0x400")
 DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-2,"Uint","0x400")
 DllCall("DrawMenuBar","Int",hWnd)
Return ""
}







Currentwinowtitle = nottf2
currentslot = 1
lastslot = 3
lastlastslot = 2
tempslot = X
tempslot2 = X
tempslot3 = X
togglestate = Turn off
QKEY = Q
1KEY = U
2KEY = I
3KEY = O
4KEY = P
5KEY = [
bunny = 0
capslock = 0
DebugMode = 0
TF2Folder = 1
tfpath = XXX
stop = D
tempdis = 0
break = 0
cfg = 0



disguiseKit = 0
maxslots = 4







gosub, Fileinstall
gosub, Iniread
gosub, Hotkeys
gosub, Settimer
gosub, Mainwindow
return








error:
MsgBox,, Error, A Error a occurred, Please Report the Bug. Sorry for my bad coding :)
goto, Exit






exit:
FileDelete, %A_Temp%\AHK_TF2_ICON
FileDelete, %A_Temp%\AHK_TF2_X
FileDelete, %A_Temp%\AHK_TF2_questionmark %A_Temp%\AHK_TF2_REALICON.ico
FileDelete, %A_Temp%\AHK_TF2_REALICON.ico
gui, Destroy
ExitApp
Exit
return





delete:
MsgBox,, Error, A Error a occurred with the config.ini, Please Report the Bug. Sorry for my bad coding :)
FileDelete, %A_Temp%\AHK_TF2_config.ini
goto, Exit
return

uiMove:
PostMessage, 0xA1, 2,,, A
Return





FileInstall:
FileInstall, icon.ico, %A_Temp%\AHK_TF2_REALICON.ico
FileInstall, background.png, %A_Temp%\AHK_TF2_ICON
FileInstall, X.png, %A_Temp%\AHK_TF2_X
FileInstall, questionmark.png, %A_Temp%\AHK_TF2_questionmark
Menu, TRAY, Icon, %A_Temp%\AHK_TF2_REALICON.ico,, 1
return






FolderSelect:
FileSelectfolder, TFpath, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 0,Please select your tf folder.`re.g C:\Program Files (x86)\Steam\SteamApps\common\Team Fortress 2\tf
IniWrite, %TFpath%,  %A_Temp%\AHK_TF2_config.ini, TF2, TFpath
TF2Folder = 0
IniWrite, %TF2Folder%, %A_Temp%\AHK_TF2_config.ini, Checkbox, TF2Folder
gui, Destroy
goto MainWindow
return



togglestate:
if (togglestate = "Turn on") {
	togglestate = Turn off
} else {
	togglestate = Turn on
}
gosub, RefreshGUI
return





















;				=====================================================================
;          .______     _______ .______    _______ .___________. __  .__   __.   _______ 
;          |   _  \   |   ____||   _  \  |   ____||           ||  | |  \ |  |  /  _____|
;          |  |_)  |  |  |__   |  |_)  | |  |__   `---|  |----`|  | |   \|  | |  |  __  
;          |      /   |   __|  |   ___/  |   __|      |  |     |  | |  . `  | |  | |_ | 
;          |  |\  \-. |  |____ |  |      |  |____     |  |     |  | |  |\   | |  |__| |  
;          | _| `.__| |_______|| _|      |_______|    |__|     |__| |__| \__|  \______| 
;
;				=====================================================================


SetTimer:
SetTimer, RefreshGUI, 1000
SetTimer, GetWindowname, 250
;SetTimer, CapsLock, 250
SetTimer, GetCurrentSlot, 100
;SetTimer, Bunny, -10000
;SetTimer, Hopp, 125
;SetTimer, SetCurrentSlot, 20
if (cfg = "1") {
	SetTimer,  readcfg, 250
}
return


GetCurrentSlot:
if (togglestate = "Turn off" and windowfound = "1" and tempdis = "0" and maxslots <> "5") {
Hotkey, *$1, 1K, on
Hotkey, *$2, 2K, on
Hotkey, *$3, 3K, on
Hotkey, *$4, 4K, on
Hotkey, *$5, 5K, On
Hotkey, *$6, 6K, On
Hotkey, *$7, 7K, On
Hotkey, *$8, 8K, On
Hotkey, *$9, 9K, On
Hotkey, *$%QKEY%, QKEY,On
Hotkey, *$WheelDown, WheelDown, on
Hotkey, *$Wheelup, Wheelup, on
} else if (togglestate = "Turn off" and windowfound = "1" and tempdis = "1" and maxslots <> "5") {
Hotkey, *$%QKEY%, QKEY,On
Hotkey, *$WheelDown, WheelDown, on
Hotkey, *$Wheelup, Wheelup, on
} else if (togglestate = "Turn off" and windowfound = "1" and maxslots = "5") {
Hotkey, *$1, 1K, off
Hotkey, *$2, 2K, off
Hotkey, *$3, 3K, off
Hotkey, *$4, 4K, off
Hotkey, *$5, 5K, off
Hotkey, *$6, 6K, off
Hotkey, *$7, 7K, off
Hotkey, *$8, 8K, off
Hotkey, *$9, 9K, off
Hotkey, *$%QKEY%, QKEY,off
Hotkey, *$WheelDown, WheelDown, off 
Hotkey, *$Wheelup, Wheelup, off 
} else {
Hotkey, *$Capslock, CapsLock,off
Hotkey, *$1, 1K, off
Hotkey, *$2, 2K, off
Hotkey, *$3, 3K, off
Hotkey, *$4, 4K, off
Hotkey, *$5, 5K, off
Hotkey, *$6, 6K, off
Hotkey, *$7, 7K, off
Hotkey, *$8, 8K, off
Hotkey, *$9, 9K, off
Hotkey, *$%QKEY%, QKEY,off
Hotkey, *$WheelDown, WheelDown, off 
Hotkey, *$Wheelup, Wheelup, off 
}
IF (CapsLock = "1" and togglestate = "Turn off" and windowfound = "1") {
Hotkey, *$Capslock, CapsLock,on
} else {
Hotkey, *$Capslock, CapsLock,off	
}
return



Bunny:
return













RefreshGUI:
if (Currentwindow <> "MainMenu") {
	GuiControl,, Button1, %togglestate%
	if (debugmode = 1){
		GuiControl,, static1,Current:%currentslot%  Slots:%maxslots%
	}
}
return







CapsLock:
Send, {CapsLock}
SetCapsLockState, off
return






GetWindowname:
WinGetActiveTitle, title
if (title <> "Team Fortress 2") {
	;Suspend, on
	windowfound = 0
	gosub, GetCurrentSlot
} else if (title == "Team Fortress 2") {
	;Suspend, off
	windowfound = 1
	gosub, GetCurrentSlot
}
return

































;				=====================================================================
;		____    __    ____  __  .__   __.  _______   ______   ____    __    ____     _______.
;		\   \  /  \  /   / |  | |  \ |  | |       \ /  __  \  \   \  /  \  /   /    /       |
;		 \   \/    \/   /  |  | |   \|  | |  .--.  |  |  |  |  \   \/    \/   /    |   (----`
;		  \            /   |  | |  . `  | |  |  |  |  |  |  |   \            /      \   \    
;		   \    /\    /    |  | |  |\   | |  '--'  |  `--'  |    \    /\    /   .----)   |   
;		    \__/  \__/     |__| |__| \__| |_______/ \______/      \__/  \__/    |_______/    
;
;				=====================================================================




MainWindow:


Gui, Color, bd3b3b,
Gui, -Caption AlwaysOnTop
gui, font, s15, Verdana


Gui, Add, Edit, r1 -Wrap Lowercase center x10 y200 w25 h20 limit1 vQKEY, %QKEY%
Gui, Add, Edit, r1 -Wrap Lowercase center x10 y250 w25 h20 limit1 v1KEY, %1KEY%
Gui, Add, Edit, r1 -Wrap Lowercase center x10 y300 w25 h20 limit1 v2KEY, %2KEY%
Gui, Add, Edit, r1 -Wrap Lowercase center x10 y350 w25 h20 limit1 v3KEY, %3KEY%
Gui, Add, Edit, r1 -Wrap Lowercase center x10 y400 w25 h20 limit1 v4KEY, %4KEY%
Gui, Add, Edit, r1 -Wrap Lowercase center x10 y450 w25 h20 limit1 v5KEY, %5KEY%


Gui, Add, text, r1 -Wrap Uppercase guimove x40 y203 h20 w250, Quickswitch
Gui, Add, text, r1 -Wrap Uppercase guimove x40 y253 h20 w250, Primary Weapon
Gui, Add, text, r1 -Wrap Uppercase guimove x40 y303 h20 w250, Secondary Weapon
Gui, Add, text, r1 -Wrap Uppercase guimove x40 y353 h20 w250, Melle Weapon
Gui, Add, text, r1 -Wrap Uppercase guimove x40 y403 h20 w250, Disguise Kit
Gui, Add, text, r1 -Wrap Uppercase guimove x40 y453 h20 w250, PDA

; MsgBox, Path: %tfpath%    Check: %TF2Folder%
if (tfpath = "XXX" or TF2Folder = 1) {
	Gui, Add, Checkbox, x310 y203 vtf2folder Checked, Choose TF Folder
} else if (tfpath = "ERROR"){
	Gui, Add, Checkbox, x310 y203 vtf2folder CheckedGray, Choose TF Folder
} else {
	Gui, Add, Checkbox, x310 y203 vtf2folder, Choose TF Folder
}


if (bunny = "1") {
Gui, Add, Checkbox, x310 y253 vbunny Checked, Bunny Hop
} else if (bunny = "0") {
Gui, Add, Checkbox, x310 y253 vbunny, Bunny Hop
} else goto delete

if (capslock = "1") {
Gui, Add, Checkbox, x310 y303 vcapslock Checked, Disable CapsLock
} else if (capslock = "0") {
Gui, Add, Checkbox, x310 y303 vcapslock, Disable CapsLock
} else goto delete

if (DebugMode = "1") {
Gui, Add, Checkbox, x310 y353 vDebugMode Checked, Debug mode
} else if (DebugMode = "0") {
Gui, Add, Checkbox, x310 y353 vDebugMode, Debug mode
} else goto delete




Gui, Add, Button, x310 y400 h40 w280 gIniwrite, Save Settings
Gui, Add, Button, x310 y450 h40 w280 gwriteconfigs, Write .cfg



Gui, Add, Picture,  x10 y10 h175 w554 guimove, %A_Temp%\AHK_TF2_ICON
Gui, Add, Picture, x567 y10 h25 w25 gexit, %A_Temp%\AHK_TF2_X
Gui, Add, Picture, x567 y45 h25 w25 ginfo, %A_Temp%\AHK_TF2_questionmark



Gui, Add, Button, x10 y500 h40 w580 gSubmit, Submit

Currentwindow = MainMenu
gui, show, w600 h550, TF2 Weapon Switcher
gosub, RefreshGUI
return




Submit:
gui, submit
gui, Destroy
if (bunny = "1") {
	Hotkey, $space, spacehot, on
}


if (tf2folder = "1") {
		goto, Folderselect
}
gosub, togglewindow
return






writeconfigs:
gui, 4:Color, 9d312f,
gui, 4: -Caption AlwaysOnTop Border
gui, 4: font, s10, Verdana
gui, 4: add, Text, center x10 y10 h250 guimove w230, This Feture adds Text to your class.cfg (e.g. soldier.cfg, pyro.cfg, scout.cfg) Please make sure to Backup your cfg files! Because this is an early version the engineer is not fully supported, because the build menu is really complicated.`n`n `n`nAre you Sure,`n that you wanna do that ?
gui, 4: font, s15, Verdana
gui, 4: add, Button, center x10 y270 h40 w110 gdontdestroy4, Do It
gui, 4: add, Button, center x130 y270 h40 w110  gdestroy4, Cancel
gui, 4:show, h320 w250
return
destroy4:
gui, 4:destroy
return
dontdestroy4:
gui, 4:destroy
gosub, writecfg
return










info:
gui, 3:Color, 9d312f,
gui, 3: -Caption AlwaysOnTop Border
gui, 3: font, s10, Verdana
gui, 3: add, Text, center x10 y10 h230 guimove w230, Please Select your Quickswitch Key. If you have your primary weapon equiped, the script presses "U". You have to bind U to someting in Game. This Script is made in Auto HotKey. Everything is written by Meisterlala. If enough people like this Script, I may release a Version for CS:GO. Please send me bugs and tips on how i should improve this programm. Sorry for my bad english. Thanks you for downloading this Programm:
gui, 3: font, s15, Verdana
gui, 3: add, text, center x10 y240 h30 guimove w230 c5b7a8c , %A_UserName%
gui, 3: add, Button, center x10 y270 h40 w230 gdestroy3, OK
gui, 3: show, h320 w250
return
destroy3:
gui, 3:destroy
return





ToggleWindow:
Currentwindow = ToggleWindow
if (debugmode = "1") {
	gui, +AlwaysOnTop -Caption
} else {
	gui, -AlwaysOnTop -Caption	
}


Gui, Color, bd3b3b,
Gui,  +SysMenu +MinimizeBox 
gui, font, s15, Verdana
Gui, Add, text, -Wrap Uppercase guimove x25 y5 h30 w220 center, TF2 Weapon Switcher  ; draggable
Gui, Add, Button, x10 y40 h60 w280 gtogglestate -Tabstop , %Togglestate%
; Gui, Add, Picture, x270 y5 h20 w20 gexit, X
Gui, Add, Picture, x265 y5 h25 w25 gexit, %A_Temp%\AHK_TF2_X

gui, show,  w300 h110, TF2 Weapon Switcher
; DisableCloseButton()

return

























;				=====================================================================
;                                         __  .__   __.  __  
;                                        |  | |  \ |  | |  | 
;                                        |  | |   \|  | |  | 
;                                        |  | |  . `  | |  | 
;                                        |  | |  |\   | |  | 
;                                        |__| |__| \__| |__| 
;                                               
;				=====================================================================




IniRead:
IfExist, %A_Temp%\AHK_TF2_config.ini
{
	IniRead, QKey, %A_Temp%\AHK_TF2_config.ini, Keybinds, Quickswitch
	IniRead, 1Key, %A_Temp%\AHK_TF2_config.ini, Keybinds, PrimaryWeapon
	IniRead, 2Key, %A_Temp%\AHK_TF2_config.ini, Keybinds, SecondaryWeapon
	IniRead, 3Key, %A_Temp%\AHK_TF2_config.ini, Keybinds, MelleWeapon
	IniRead, 4Key, %A_Temp%\AHK_TF2_config.ini, Keybinds, DisguiseKit
	IniRead, 5Key, %A_Temp%\AHK_TF2_config.ini, Keybinds, PDA
	
	IniRead, bunny, 		%A_Temp%\AHK_TF2_config.ini, Checkbox, BunnyHopp
	IniRead, CapsLock, 		%A_Temp%\AHK_TF2_config.ini, Checkbox, CapsLock
	IniRead, DebugMode, 	%A_Temp%\AHK_TF2_config.ini, Checkbox, DebugMode
	IniRead, TF2Folder, %A_Temp%\AHK_TF2_config.ini, Checkbox, TF2Folder
	
	IniRead, CFG, %A_Temp%\AHK_TF2_config.ini, TF2, CFG
	IniRead, TFpath, %A_Temp%\AHK_TF2_config.ini, TF2, TFpath

	;MsgBox, Config File Found
	return
} else {
	;MsgBox, Config File Not Found
	return
}



Iniwrite:
gui, submit, NoHide

IniWrite, %QKey%, %A_Temp%\AHK_TF2_config.ini, Keybinds, Quickswitch
IniWrite, %1Key%, %A_Temp%\AHK_TF2_config.ini, Keybinds, PrimaryWeapon
IniWrite, %2Key%, %A_Temp%\AHK_TF2_config.ini, Keybinds, SecondaryWeapon
IniWrite, %3Key%, %A_Temp%\AHK_TF2_config.ini, Keybinds, MelleWeapon
IniWrite, %4Key%, %A_Temp%\AHK_TF2_config.ini, Keybinds, DisguiseKit
IniWrite, %5Key%, %A_Temp%\AHK_TF2_config.ini, Keybinds, PDA


IniWrite, %bunny%, %A_Temp%\AHK_TF2_config.ini, Checkbox, BunnyHopp
IniWrite, %CapsLock%, %A_Temp%\AHK_TF2_config.ini, Checkbox, CapsLock
IniWrite, %DebugMode%, %A_Temp%\AHK_TF2_config.ini, Checkbox, DebugMode

gui, 2:Color, 9d312f,
gui, 2: -Caption AlwaysOnTop Border
gui, 2: font, s15, Verdana
gui, 2: add, Text, center x10 y10 h40 guimove w230, Succesfully saved
gui, 2: add, Button, center x10 y50 h40 w230 gdestroy2, OK
gui, 2:show, h100 w250
return
destroy2:
gui, 2:destroy
return
















;				=====================================================================
;                                      
;                                       
;                                      .cfg
;
;
;                                               
;				=====================================================================


writecfg:
if (tfpath = "XXX" or TF2Folder = 1) {
	MsgBox, 4096,, Plese Choose your TF Folfder first
} else if (tfpath = "ERROR"){
	MsgBox, 4096,, Plese Choose your TF Folfder first

} else {
	IfExist, %tfpath%\cfg
	{
		FileDelete, %tfpath%\condump*.txt
		gosub, writeclasses
		return
	} 

}

return







writeclasses:

classname = scout
donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)

loop, 9
{
if (classname = "scout") {
	classname = soldier
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
} else if (classname = "soldier") {
	classname = pyro
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
} else if (classname = "pyro") {
	classname = demoman
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
} else if (classname = "demoman") {
	classname = heavyweapons
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
} else if (classname = "heavyweapons") {
	classname = engineer

	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
echo four
condump
echo five
condump
)
} else if (classname = "engineer") {
	classname = medic
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
} else if (classname = "medic") {
	classname = sniper
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
} else if (classname = "sniper") {
	classname = spy
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
echo four
condump
)
} else if (classname = "spy") {
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
	classname = scout
} else {
	classname = scout
	donttuochthis =
(
clear
echo First
condump
echo Second
condump
echo third
condump
)
}








FileRead, Content, %tfpath%\cfg\%classname%.cfg
IfInString, Content, //////////// This Is Created with the TF2 Weapon Switcher ////////////
{
    MsgBox, 4096, Error, The cfg-files were already created.
	cfg = 1
	IniWrite, %CFG%, %A_Temp%\AHK_TF2_config.ini, TF2, CFG
	Content = 0
    return
}
else 
{
Content = 0
FileAppend,
(





//////////// This Is Created with the TF2 Weapon Switcher ////////////
////////////      Currnetly dosnt work with engineer      ////////////



bind "%1Key%" ""						// Enter Here your command, that gets executed if you have your Primary weapon equiped
bind "%2Key%" ""						// Enter Here your command, that gets executed if you have your Secondary weapon equiped
bind "%3Key%" ""						// Enter Here your command, that gets executed if you have your Meele weapon equiped
bind "%4Key%" ""						// Enter Here your command, that gets executed if you have your Disguise Kit equiped
bind "%5Key%" ""						// Not Yet Supported. Enter Here your command, that gets executed if you have your PDA equiped


/////////////////////// Please dont touch this  //////////////////////
%donttuochthis%
////////////////////////// This is the End  //////////////////////////




), %tfpath%\cfg\%classname%.cfg
}
}


cfg = 1
IniWrite, %CFG%, %A_Temp%\AHK_TF2_config.ini, TF2, CFG
MsgBox, 4096, Done, Succesfull written all config Files


return














readcfg:


IfExist, %tfpath%\condump004.txt
	{
		FileDelete, %tfpath%\condump*.txt
		maxslots = 5
		disguiseKit = 0
		return
	}
IfExist, %tfpath%\condump003.txt
	{
		FileDelete, %tfpath%\condump*.txt
		maxslots = 4
		disguiseKit = 0
		return
	} 
IfExist, %tfpath%\condump002.txt
	{
		FileDelete, %tfpath%\condump*.txt
		maxslots = 3
		return
	} 
FileDelete, %tfpath%\condump*.txt	


return




















;				=====================================================================
;                                      
;                                       
;                                     	GetCurrentSlot
;
;
;                                               
;				=====================================================================




1K:
send, {Blind}1
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
} else if (currentslot <> "1" and tempdis = "0") {
lastlastslot = %lastslot%
lastslot = %currentslot%
currentslot = 1	
gosub commands
gosub, RefreshGUI
}
return



2K:
send, {Blind}2
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
} else if (currentslot <> 2 and tempdis = "0") {
lastlastslot = %lastslot%
lastslot = %currentslot%
currentslot = 2	
gosub commands
gosub, RefreshGUI
}
return

3K:
send, {Blind}3
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
} else if (currentslot <> 3 and tempdis = "0") {
lastlastslot = %lastslot%
lastslot = %currentslot%
currentslot = 3
gosub commands
gosub, RefreshGUI
}
return

4K:
send, {Blind}4
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
} else if (maxslots >= "4" ) {
if (currentslot <> 4 and tempdis = "0") {
lastlastslot = %lastslot%
lastslot = %currentslot%
currentslot = 4	
gosub commands
gosub, RefreshGUI
}
}
return

5K:
send, {Blind}5
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
} else if (maxslots >= "5" ) {
if (currentslot <> 5 and tempdis = "0") {
lastlastslot = %lastslot%
lastslot = %currentslot%
currentslot = 5	
gosub commands
gosub, RefreshGUI
}
}
return



6K:
send, {Blind}6
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
}
return


7K:
send, {Blind}7
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
}
return


8K:
send, {Blind}8
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
}
return


9K:
send, {Blind}9
if (rebind15 = 1) {
	
	Currentslot := tempslot2
	lastslot := tempslot3
	tempdis = 0
	rebind15 = 0
	gosub, RefreshGUI
	gosub commands
}
return












Wheelup:
send, {Blind}{Wheelup}
if (maxslots = "3") {
	if (currentslot = "3") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 1
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "2") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 3
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "1") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 2
		gosub commands
		gosub, RefreshGUI
	}
} else if (maxslots = "4") {
	if (currentslot = "4") {
		break = 1
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 1
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "3") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 4
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "2") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 3
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "1") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 2
		gosub commands
		gosub, RefreshGUI
	}
} else if (maxslots = "5") {
	if (currentslot = "5") {
		break = 1
		;MsgBox, 5
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 1
		return
		gosub commands
		gosub, RefreshGUI
		return
	} else if (currentslot = "4") {

		break = 1
	;	MsgBox, 4
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 5
		return
		gosub commands
		gosub, RefreshGUI
		return
	} else if (currentslot = "3") {
	;	MsgBox, 3
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 4
		gosub commands
		gosub, RefreshGUI
		return
	} else if (currentslot = "2") {
	;	MsgBox, 2
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 3
		gosub commands
		gosub, RefreshGUI
		return
	} else if (currentslot = "1") {
	;	MsgBox, 1
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 2
		gosub commands
		gosub, RefreshGUI
		return
	}
}
break = 0
return
















WheelDown:
send {Blind}{Wheeldown}
if (maxslots = 3){
	if (currentslot = "3") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 2
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "2") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 1
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "1") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 3
		gosub commands
		gosub, RefreshGUI
	}
}
if (maxslots = 4){
	if (currentslot = "4") {
		break = 1
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 3
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "3") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 2
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "2") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 1
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "1") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 4
		gosub commands
		gosub, RefreshGUI
	}
}
if (maxslots = 5){
	if (currentslot = "5") {
		break = 1
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 4
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "4") {
		break = 1
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 3
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "3") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 2
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "2") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 1
		gosub commands
		gosub, RefreshGUI
	} else if (currentslot = "1") {
		lastlastslot = %lastslot%
		lastslot = %currentslot%
		currentslot = 5
		gosub commands
		gosub, RefreshGUI
	}
}
break = 0
return






QKEY:
lastlastslot = %lastslot%
tempslot = %lastslot%
lastslot = %currentslot%
currentslot = %tempslot%
gosub, RefreshGUI
send, {Blind}{q up}
	if (currentslot = "1") {
		send, {Blind}1
	} else if (currentslot = "2") {
		send, {Blind}2
	} else if (currentslot = "3") {
		send, {Blind}3
	} else if (currentslot = "4") {
		send, {Blind}4
	} else if (currentslot = "5") {
		send, {Blind}5
	}
goto commands
gosub, RefreshGUI
return


































;				=====================================================================
;                                      
;                                       
;                                     	ExecSlot
;
;
;                                               
;				=====================================================================



commands:
if (title = "Team Fortress 2" and togglestate = "Turn off") {
	if (currentslot = "1") {
		send, {Blind}%1KEY%
	} else if (currentslot = "2") {
		send, {Blind}%2KEY%
	} else if (currentslot = "3") {
		send, {Blind}%3KEY%
	} else if (currentslot = "4") {
		send, {Blind}%4KEY%
		gosub, build
		gosub, disguise
	} else if (currentslot = "5") {
		send, {Blind}%5KEY%
		; gosub, destroy
	}
}
return










disguise:

tempslot = %currentslot%
tempslot2 = %lastslot%
tempslot3 = %lastlastslot%
if (maxslots = 4 and togglestate = "Turn off") {
	rebind15 = 1
	
} else {
rebind15 = 0	

}
return





build:
tempslot = %currentslot%
tempslot2 = %lastslot%
tempslot3 = %lastlastslot%
if (maxslots = 5 and togglestate = "Turn off") {
	rebind15 = 1
	
} else {
rebind15 = 0	

}
return












Destroy:
tempslot = %currentslot%
tempslot2 = %lastslot%
tempslot3 = %lastlastslot%
if (maxslots = 5 and togglestate = "Turn off") {
	rebind15 = 1
	
} else {
rebind15 = 0	

}
return



























;				=====================================================================
;              __    __    ______   .___________. __  ___  ___________    ____  _______.
;             |  |  |  |  /  __  \  |           ||  |/  / |   ____\   \  /   / /       |
;             |  |__|  | |  |  |  | `---|  |----`|  '  /  |  |__   \   \/   / |   (----`
;             |   __   | |  |  |  |     |  |     |    <   |   __|   \_    _/   \   \    
;             |  |  |  | |  `--'  |     |  |     |  .  \  |  |____    |  | .----)   |   
;             |__|  |__|  \______/      |__|     |__|\__\ |_______|   |__| |_______/    
;
;				=====================================================================


hotkeys:


Hotkey, *$1, 1K, off
Hotkey, *$2, 2K, off
Hotkey, *$3, 3K, off
Hotkey, *$4, 4K, off
Hotkey, *$5, 5K, off
Hotkey, *$6, 6K, off
Hotkey, *$7, 7K, off
Hotkey, *$8, 8K, off
Hotkey, *$9, 9K, off
Hotkey, *$%QKEY%, QKEY, off


Hotkey, *$WheelDown, WheelDown, off 
Hotkey, *$Wheelup, Wheelup, off 



Hotkey, *$Capslock, CapsLock,off
Hotkey, *$space, spacehot,off

return







Spacehot:
send, {Space}
if (bunny = "1" and windowfound = "1") {
    KeyWait Space, T0.5                ; TIME
    If ErrorLevel                   ; Still held down
        While GetKeyState("Space","p"){ ; While it is held down
            Send, {Blind}{Space}
			Sleep, 1
        }
;    Else                            ; They let go in time
  ;      Send, {Space}
}

return






