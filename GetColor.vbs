Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject ("Scripting.FileSystemObject")
WshShell.Run WScript.Arguments.Item(0) & "@Resources\ImageMagickScripts\convert.exe " & WScript.Arguments.Item(1) & "  -scale 1x1! -format '%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]' info:", 0, false
WScript.Quit