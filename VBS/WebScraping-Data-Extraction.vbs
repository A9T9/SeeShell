'
'Web Scraping Demo Script
'
'V1.1 2017/4/13
'V2.0 2017/5/23 - Adapted for new extract features
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
data = Split(allData, "[DATA]")

'In this case we ignore all the extracted HTML and URLs, this is only in the macro for demo purposes
'In this script, we only care and display the extracted TEXT data - the exchange rate

'line 0 - BTC HTML code 
'line 1 - BTC Text... we need this
'line 2 - BTC Link... not needed
'line 3 - OCR'ed result (here the same as the text, but OCR works even with images and PDF)
'line 4 - Currency rates - needed

msgbox "Today's Bitcoin/US$ exchange rate is "+data(0)  'FIRST element has index = 0


s= "Today's currency exchange rates are"+vbCrLf+vbCrLf 
dim iStartPos 

iStartPos = 6
s = s+"USD/EUR: "+data(iStartPos+1)+vbCrLf 
s = s+ "USD/GBP: "+data(iStartPos+3)+vbCrLf 
s = s+ "USD/CNY: "+data(iStartPos+5)+vbCrLf 
s = s+ "EUR/GBP: "+data(iStartPos+4)+vbCrLf 
s = s+ "EUR/CNY: "+data(iStartPos+0)+vbCrLf 
s = s+ "GBP/CNY: "+data(iStartPos+2) +vbCrLf+vbCrLf 
s= s+ "In the next step, the data will be saved (appended) to a CSV file."
msgbox s


'SAVE TO CSV FILE
Dim sOut, fso, objFile
Const ForAppending = 8
sOut = "./exchangerates.txt"

Set fso = CreateObject("Scripting.fileSystemObject")
Set objFile = fso.OpenTextFile( sOut, ForAppending, True )

'Same "Today's exchange rates" to a file in CSV format
s = FormatDateTime(Now) + ","+  data(iStartPos+0) + "," + data(iStartPos+1) + "," + data(iStartPos+2) + "," + data(iStartPos+3) + "," + data(iStartPos+4) + "," + data(iStartPos+5)  
objFile.WriteLine(s)
objFile.Close
Set fso = Nothing

	
	
msgbox ("Data saved. Press OK to close Kantu")
i = objKantu.close()

WScript.Quit(i)