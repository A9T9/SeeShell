'
' Self-test for the Kantu API and Kantu Browser replay
' 
' This script runs all demo scripts and logs the result
'
' Script version: V1.20, 2016-12-19 
'


option Explicit

Dim objFileSystem, objFile, myKantu
Dim strOutputFile, i
dim objList, element, hasError

Const OPEN_FILE_FOR_APPENDING = 8

' generate a logfile name based on the script name
strOutputFile = "./log_"+  Wscript.ScriptName + ".txt" 
Set objFileSystem = CreateObject("Scripting.fileSystemObject")
Set objFile = objFileSystem.CreateTextFile(strOutputFile, TRUE)

msgbox ("Click OK to start. This test will take a few minutes.")

objFile.WriteLine("Self-Test started at " + cstr (now))

set myKantu = CreateObject ("Kantu")
if  myKantu Is Nothing then 
	objFile.WriteLine("CreateObject ERROR: " + cstr(i) + " Text: " + myKantu.getLastError())
    hasError = true
end if 

i = myKantu.open(true)
if  i < 0 then 
	objFile.WriteLine("Open ERROR: " + cstr(i) + " Text: " + myKantu.getLastError())
    hasError = true
end if 

'List of Test Scripts
Set objList = CreateObject("System.Collections.ArrayList")
objList.Add "Demo-Automate-Forms.xkts"
objList.Add "Demo-Selectbox.xkts"
objList.Add "Demo-ITA-Flight-Search.xkts"
objList.Add "Demo-ContactUs.xkts"
objList.Add "Demo-Mouse-Draw.xkts"
objList.Add "Demo-Variables.xkts"
objList.Add "Demo-Download.xkts"
objList.Add "Demo-Upload.xkts"

'Run the tests!
Dim testnumber
testnumber = 1 
For Each element In objList

  i = myKantu.echo ("Currently testing: " + element + " (" + cstr(testnumber) +" of " + cstr(objList.Count)+")")
  i = myKantu.Play (cstr(element))  
  
  if i >= 0 then
   objFile.WriteLine("Play OK: " + element)
  else
    objFile.WriteLine("Play ERROR, Script: " + element + " Error code: "  + cstr(i) + " Text: "+myKantu.getLastError())
	hasError = true
  end if 
  testnumber = testnumber+1
 
Next

'Close Kantu
i = myKantu.close
if  i < 0 then 
	objFile.WriteLine("Open ERROR: " + cstr(i) + " Text: " + myKantu.getLastError())
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