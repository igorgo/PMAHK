;#SingleInstance force
;#NoEnv
;#Persistent ; Stay open in background
;SendMode Input
;StringCaseSense, On ; Match strings with case.
;SetWorkingDir %A_ScriptDir%

;If (A_AhkVersion <= "1.1.22")
;{
;    msgbox, You need AutoHotkey v1.1.22 or later to run this script. `n`nPlease go to http://ahkscript.org/download and download a recent version.
;    exit
;}

if not A_IsAdmin ; admin is needed to make sure it can kill off the connection.
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

^End::
  SoundPlay *64
  Reload
Return

; Storage Tools
; =============================================================================
#Ifwinactive, Path of Exile
~+WheelDown::
	Send {Right}
return

#Ifwinactive, Path of Exile
~+WheelUp::
	Send {Left}
return

#Ifwinactive, Path of Exile
~a::
	SendInput, {Left}{End}
return

#Ifwinactive, Path of Exile
~d::
	SendInput, {Right}
return

#Ifwinactive, Path of Exile
~+a::
  SendInput, {Left 40}{End}
return

#Ifwinactive, Path of Exile
~+d::
  SendInput, {Right 40}
return


; Quick Disconnect.
; ============================================================================
#Ifwinactive, Path of Exile
`::
	string:= "cports.exe /close * * * * PathOfExile.exe"
	ltime := lastlogout + 2500
	if ( ltime < A_TickCount ) {
		Run, %string%
		lastlogout := A_TickCount
	}
  sleep 2
	SendInput, {Enter}
return


; Utility Macros
; F2 = Hideout
; F3 = Remaining Monsters
; F4 = itemlevel
; F5 = Party Invite the last person who PM'ed you.
; ============================================================================
#Ifwinactive, Path of Exile
~F2::
	BlockInput On
	SendInput, {Enter}
	Sleep 2
	SendInput, {/}hideout
	SendInput, {Enter}
	BlockInput Off
	return
return

#Ifwinactive, Path of Exile
~F6::
	BlockInput On
	Send ^{Enter}{Home}{Delete}/invite {Enter}
	BlockInput Off
	return
return

; Chat Macros
; Alt + 1 tells the pm-er you're in a map.
; Alt + 2 thanks the pm-er.
; ============================================================================

#IfWinActive, Path of Exile
LAlt & 1::
	BlockInput On
	SendInput, ^{Enter}
	Sleep 2
	SendInput, One moment please, I'm in a map.
	SendInput, {Enter}
	BlockInput Off
	return
return
; I hope that it will be useful.
#IfWinActive, Path of Exile
LAlt & 2::
	BlockInput On
	SendInput, ^{Enter}
	Sleep 2
	SendInput, Thanks for trade. May the Force be with you!
	SendInput, {Enter}
	BlockInput Off
	return
return

#IfWinActive, Path of Exile
LAlt & 3::
	BlockInput On
	SendInput, ^{Enter}
	Sleep 2
	SendInput, Sorry, just sold.
	SendInput, {Enter}
	BlockInput Off
	return
return

#IfWinActive, Path of Exile
LAlt & 4::
	BlockInput On
	SendInput, ^{Enter}
	Sleep 2
	SendInput, Sorry, I'm in the lab. I'll pm to you, when I finish.
	SendInput, {Enter}
	BlockInput Off
	return
return

#IfWinActive, Path of Exile
LAlt & 5::
	BlockInput On
	SendInput, {Enter}
	Sleep 2
	SendInput, /afk There is a smokebreak, i'll be back in 5 min. �������, ���� �/� 5 ���.
	SendInput, {Enter}
	BlockInput Off
	return
return


