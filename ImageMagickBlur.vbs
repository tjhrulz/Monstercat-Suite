Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "C:\Users\tjhrulz\Documents\Rainmeter\Skins\Monstercat-Suite\@Resources\ImageMagickScripts\convert.exe" & " " & WScript.Arguments.Item(0) & " -channel RGBA -blur 0x32 " & WScript.Arguments.Item(1), 0, false
WScript.Quit