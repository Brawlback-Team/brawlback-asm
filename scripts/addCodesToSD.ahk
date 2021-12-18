#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Replaces Windows Key + c with a script that adds your codes to an SD.raw
;Runs in admin mode, so you have to accept the prompt
;You could also use the shortcut's builtin hotkey feature, but it's slow to start up, and there's less flexibility with the hotkey

#c::Run, "addCodesToSD - Shortcut.lnk"