'
'Web Scraping Demo Script
'
'V1.1 2017/4/13
'
'This script starts Kantu, and then displays the extract currency conversion rate data in a message box
'and then saves it in a CSV formatted text file
'

option Explicit

dim objKantu, i, s, allData, data, line

set objKantu = CreateObject ("kantu")
If objKantu Is Nothing Then msgbox ("API not installed")


i = objKantu.open(true)
if i < 0 then msgbox ("Start error: " + cstr(i) +" " +objKantu.getLastError())

i = objKantu.echo ("Processing...")
i = objKantu.Play("demo-webscraping.kmacro")

if i < 0 then
    msgbox "Error playing macro: " + cstr(i) + vbCrLf + vbCrLf +"Text: "+objKantu.getLastError()
    'Stop here
    i = objKantu.close()
    WScript.Quit(i)
 end if 
  
i = objKantu.echo ("Done!")
'Display all data 
allData = objKantu.GetExtractImageData()

s = "Extraction done - this is how the raw returned data looks like:"+vbCrLf+vbCrLf
s = s+ allData+vbCrLf+vbCrLf
s = s + "Press OK to display the exchange rates."

msgbox s

'The data is separated by [REC] for each line, and by [DATA] for each line (if there is more than one pink frame)
'http://stackoverflow.com/questions/14103510/split-function-on-an-array
line = Split(allData, "[REC]")

'In this case we ignore all the extracted HTML and URLs, this is only in the macro for demo purposes
'In this script, we only care and display the extracted TEXT data - the exchange rate

'line 0 - BTC HTML code 
'line 1 - BTC Text... we need this
'line 2 - BTC Link... not needed
'line 3 - OCR'ed result (here the same as the text, but OCR works even with images and PDF)
'line 4 - Currency rates - needed

msgbox "Today's Bitcoin/US$ exchange rate is "+line(1)


'Split the line and build string for nice display
data = Split(line(4), "[DATA]")

s= "Today's currency exchange rates are"+vbCrLf+vbCrLf 
s = s+"USD/EUR: "+data(1)+vbCrLf 
s = s+ "USD/GBP: "+data(3)+vbCrLf 
s = s+ "USD/CNY: "+data(5)+vbCrLf 
s = s+ "EUR/GBP: "+data(4)+vbCrLf 
s = s+ "EUR/CNY: "+data(0)+vbCrLf 
s = s+ "GBP/CNY: "+data(2) +vbCrLf+vbCrLf 
s= s+ "In the next step, the data will be saved (appended) to a CSV file."
msgbox s


'SAVE TO CSV FILE
Dim sOut, fso, objFile
Const ForAppending = 8
sOut = "./data.txt"

Set fso = CreateObject("Scripting.fileSystemObject")
Set objFile = fso.OpenTextFile( sOut, ForAppending, True )
s = FormatDateTime(Now) + ","+  data(0) + "," + data (1) + "," + data (2) + "," + data (3) + "," + data (4) + "," + data (5)  
objFile.WriteLine(s)
objFile.Close
Set fso = Nothing

	
	
msgbox ("Data saved. Press OK to close Kantu")
i = objKantu.close()

WScript.Quit(i)