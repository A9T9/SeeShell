#
#
# Powershell Demo Script for the Kantu API (Implemented as COM Object)
# Script version: V1.0, 2016-12-05 
#
#

Write-Host "Hello Kantu User!"

$comObj = new-object -ComObject Kantu

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

[System.Windows.Forms.MessageBox]::Show("Click OK to start Kantu")

#10 in open (10) is the max time to wait for Kantu to start.
#If Kantu would take longer (e. g. very high CPU load) then the open command returns a timeout error

$comObj.open(10)

$comObj.Echo("This is a message from Powershell")

$i = $comObj.Play("Demo-Automate-Forms.xkts")

[System.Windows.Forms.MessageBox]::Show($i)
[System.Windows.Forms.MessageBox]::Show($comObj.GetLastError())
[System.Windows.Forms.MessageBox]::Show("Click OK to close Kantu")

$comObj.Close(10)