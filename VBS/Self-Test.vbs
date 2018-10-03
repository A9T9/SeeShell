'
' Self-test for Browser replay
' 
' This script runs all demo scripts and logs the result
'

option Explicit

Dim objFileSystem, objFile, myBrowser
Dim strOutputFile, i
dim objList, element, hasError

Const OPEN_FILE_FOR_APPENDING = 8

' generate a logfile name based on the script name
strOutputFile = "./log_"+  Wscript.ScriptName + ".txt" 
Set objFileSystem = CreateObject("Scripting.fileSystemObject")
Set objFile = objFileSystem.CreateTextFile(strOutputFile, TRUE)

msgbox ("Click OK to start. This test will take a few minutes.")

objFile.WriteLine("Self-Test started at " + cstr (now))

set myBrowser = CreateObject ("SeeShell.Browser")
if  myBrowser Is Nothing then 
	objFile.WriteLine("CreateObject ERROR: " + cstr(i) + " Text: " + myBrowser.getLastError())
    hasError = true
end if 

i = myBrowser.open(true)
if  i < 0 then 
	objFile.WriteLine("Open ERROR: " + cstr(i) + " Text: " + myBrowser.getLastError())
    hasError = true
end if 

'List of Test Scripts
Set objList = CreateObject("System.Collections.ArrayList")

objList.Add "Demo-Automate-Forms"
objList.Add "Demo-ITA-Flight-Search"
objList.Add "Demo-WebScraping"
objList.Add "Demo-Variables"
objList.Add "Demo-Download"
objList.Add "Demo-Upload"
objList.Add "Demo-PDF-Extract"
objList.Add "Demo-Mouse-Draw"
objList.Add "Demo-Variables"
objList.Add "Demo-Scroll"
objList.Add "Demo-Javascript"
objList.Add "Demo-ClickRelative"
objList.Add "Demo-ManyPlay-Part1"
objList.Add "Demo-ManyPlay-Part2"
objList.Add "Demo-ManyPlay-Part3"
objList.Add "Demo-Tabs"
' For Flash to work, install Flash: https://a9t9.com/kantu/flash#install
objList.Add "Demo-Flash"


'Run the tests!
Dim testnumber
testnumber = 1 
For Each element In objList

  i = myBrowser.echo ("Currently testing: " + element + " (" + cstr(testnumber) +" of " + cstr(objList.Count)+")")
  
  i = myBrowser.Play (cstr(element), 180) 'Allow up to 180 seconds (3 minutes) macro run time, otherwise the long Demo-Mouse-Draw macro triggers a time out error 
  
  if i >= 0 then
   objFile.WriteLine("Play OK: " + element)
  else
    objFile.WriteLine("Play ERROR, Script: " + element + " Error code: "  + cstr(i) + " Text: "+myBrowser.getLastError())
	hasError = true
  end if 
  testnumber = testnumber+1
 
Next

'Close 
i = myBrowser.close
if  i < 0 then 
	objFile.WriteLine("Open ERROR: " + cstr(i) + " Text: " + myBrowser.getLastError())
    hasError = true
end if 

' close log file
objFile.Close
Set objFileSystem = Nothing

'inform
if (hasError) then
  msgbox ("There were some errors. Please check the log file: " + strOutputFile)
else
  msgbox ("All tests passed.")
end  if 
 

WScript.Quit(i)