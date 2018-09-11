'
'
' VBS Demo Script for  Variables
'
'

option Explicit

msgbox ("VBS Script: Click Ok to start CSV submission")

Dim objFile, objFSO, objB, i, strLine, arrFields

Const ForReading = 1

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile("namesandemail.csv", ForReading)

set objB = CreateObject ("SeeShell.Browser")
If objB Is Nothing Then msgbox ("SeeShell Browser API not installed")


i = objB.open(true)
if i < 0 then msgbox ("Start error: " + cstr(i) +" " +objB.getLastError())


Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    arrFields = Split(strLine, ",")

	i = objB.echo ("Processing Name: " +arrFields (0) + " "++arrFields (1))
	i = objB.setVariable ("first",arrFields (0))
	i = objB.setVariable ("last", arrFields (1))
	i = objB.setVariable ("email", arrFields (2))

	i = objB.play("Demo-Variables")
	if i < 0 then msgbox ("Play error: " + cstr (i) +" " +objB.getLastError())		
Loop

objFile.Close

'Close 
msgbox ("Done, press OK to close the SeeShell Browser")
i = objB.close()


WScript.Quit(i)