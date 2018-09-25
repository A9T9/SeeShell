option Explicit

dim myBrowser, i, s, allData, data, line

set myBrowser = CreateObject ("seeshell.browser")

i = myBrowser.open(true)


i = myBrowser.echo ("first macro")
i = myBrowser.Play("testtab1")

if i < 0 then msgbox "Error playing macro: " + cstr(i) + vbCrLf + vbCrLf +"Text: "+myBrowser.getLastError()

'Get URL 
allData = myBrowser.GetExtractImageData()

'The data is separated by [DATA] for each EXTRACTADD command
data = Split(allData, "[DATA]")
msgbox "Next macro will use this URL: " +data(0)  'FIRST element has index = 0

'Restart SeeShell (optional)
i = myBrowser.close()
i = myBrowser.open(true)

i = myBrowser.setVariable ("starturl", data(0))

i = myBrowser.play("TestTab2")
if i < 0 then msgbox ("Play error: " + cstr (i) +" " +myBrowser.getLastError())		

msgbox ("Press OK to close the SeeShell Browser.")
i = myBrowser.close()

WScript.Quit(i)