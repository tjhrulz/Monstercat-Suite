Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "C:\Users\tjhrulz\Documents\Rainmeter\Skins\Monstercat-Suite\@Resources\ImageMagickScripts\convert.exe" & " " & WScript.Arguments.Item(0) & "  -scale 1x1! -format '%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]' info:", 0, false
WScript.Quit