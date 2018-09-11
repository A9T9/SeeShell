'
'
' VBS Demo Script for the Seeshell API (Implemented as COM Object)
'
'
option Explicit
Dim mySeeShell, i

'Connect to COM API
set mySeeShell = CreateObject ("seeshell")
If mySeeShell Is Nothing Then msgbox ("Couldn't find COM API")

msgbox ("Click OK to start the SeeShell now. If SeeShell is already running, the script will connect to the running instance. For desktop automation, there is always only one instance running (as there is only one mouse to control).")

' We use open(FALSE) as we always want to connect to a running instance. 
' This is one for the major differences between SeeShell (one instance only possible, as we control the desktop)
' and SeeShell Browser (many instances possible, as everything happens inside the browser.)
i = mySeeShell.open(false)
if i < 0 then msgbox ("Open SeeShell - Error: "+ cstr(i)+ " Text: " +mySeeShell.getLastError())		

i = mySeeShell.echo ("Hello from the VBS script")

'By default, SeeShell looks for the SeeShell desktop macro (.see)  in the /macros folder
'You can also use full path, like mySeeShell.play("c:\my-files\test.see") 

i = mySeeShell.setVariable ("myVar","VBS Script")
i = mySeeShell.play("DemoEditorSelfTest")
if i < 0 then  msgbox ("Script Replay Error: "+ cstr(i)+ " Text: " +mySeeShell.getLastError())		


WScript.Quit(i)