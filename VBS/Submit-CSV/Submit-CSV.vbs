'
'
' VBS Demo Script for the Kantu API and Variables
' Script version: V1.0, 2016-12-05 
'
'

option Explicit

msgbox ("VBS Script: Click Ok to start CSV submission")

Dim objFile, objFSO, objKantu, i, strLine, arrFields

Const ForReading = 1

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile("namesandemail.csv", ForReading)

set objKantu = CreateObject ("Kantu")
If objKantu Is Nothing Then msgbox ("Kantu API not installed")


i = objKantu.open(true)
if i < 0 then msgbox ("Start error: " + cstr(i) +" " +objKantu.getLastError())


Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    arrFields = Split(strLine, ",")

	i = objKantu.echo ("Processing Name: " +arrFields (0) + " "++arrFields (1))
	i = objKantu.setVariable ("first",arrFields (0))
	i = objKantu.setVariable ("last", arrFields (1))
	i = objKantu.setVariable ("email", arrFields (2))

	i = objKantu.play("Demo-Variables.xkts")
	if i < 0 then msgbox ("Play error: " + cstr (i) +" " +objKantu.getLastError())		
Loop

objFile.Close

'Close Kantu
msgbox ("Done, press OK to close Kantu")
i = objKantu.close()


WScript.Quit(i)