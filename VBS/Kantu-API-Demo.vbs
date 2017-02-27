'
'
' VBS Demo Script for the Kantu API (Implemented as COM Object)
' Script version: V1.0, 2016-12-05 
'
'
option Explicit
Dim myKantu, i

'Connect to COM API
set myKantu = CreateObject ("Kantu")
If myKantu Is Nothing Then msgbox ("Couldn't find COM API")

msgbox ("Click OK to start the Kantu Browser now")
i = myKantu.open(true)
if i < 0 then msgbox ("Open Kantu - Error: "+ cstr(i)+ " Text: " +myKantu.getLastError())		

i = myKantu.echo ("Hello from the VBS script")

'By default, Kantu looks for the xkts script in the /script folder
'You can also use full path, like myKantu.play("c:\my-files\test.xkts") 

i = myKantu.play("Demo-Automate-Forms.xkts")
if i < 0 then  msgbox ("Script Replay Error: "+ cstr(i)+ " Text: " +myKantu.getLastError())		

i = myKantu.echo ("He2222222222")
i = myKantu.play("Demo-Automate-Forms.xkts")
if i < 0 then  msgbox ("Script Replay Error: "+ cstr(i)+ " Text: " +myKantu.getLastError())		



msgbox "Click OK to close the Kantu Browser"
i = myKantu.close

WScript.Quit(i)