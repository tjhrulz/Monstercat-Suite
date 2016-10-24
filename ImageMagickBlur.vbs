Set WshShell = CreateObject("WScript.Shell")
WshShell.Run WScript.Arguments.Item(0) & "@Resources\ImageMagickScripts\convert.exe " & WScript.Arguments.Item(1) & " -channel RGBA -blur 0x32 " & WScript.Arguments.Item(2), 0, false
WScript.Quit