On Error Resume Next
Set FileSystemObject = CreateObject("Scripting.FileSystemObject")
FileSystemObject.CopyFile WScript.Arguments.Item(0), WScript.Arguments.Item(1)
On Error GoTo 0