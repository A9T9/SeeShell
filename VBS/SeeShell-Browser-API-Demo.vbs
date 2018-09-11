'
'
' VBS Demo Script (Implemented as COM Object)
'
'
option Explicit
Dim myBrowser, i

'Connect to COM API
set myBrowser = CreateObject ("SeeShell.Browser")
If myBrowser Is Nothing Then msgbox ("Couldn't find COM API")

msgbox ("Click OK to start the SeeShell Browser now")
i = myBrowser.open(true)
if i < 0 then msgbox ("Open SeeShell Browser - Error: "+ cstr(i)+ " Text: " +myBrowser.getLastError())		

i = myBrowser.echo ("Hello from the VBS script")

'By default, SeeShell Browser looks for the SeeShell Browser-macro (kmacro)  in the /macros folder
'You can also use full path, like myBrowser.play("c:\my-files\test.kmacro") 

i = myBrowser.play("Demo-Automate-Forms")
if i < 0 then  msgbox ("Script Replay Error: "+ cstr(i)+ " Text: " +myBrowser.getLastError())		



msgbox "Done - Click OK to close the SeeShell Browser"
i = myBrowser.close

WScript.Quit(i)