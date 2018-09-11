#
#
# Powershell Demo Script for the SeeShell Browser API (Implemented as COM Object)
#
#

Write-Host "Hello SeeShell Browser User!"

$comObj = new-object -ComObject SeeShell.Browser

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

[System.Windows.Forms.MessageBox]::Show("Click OK to start the SeeShell Browser")

#10 in open (10) is the max time to wait for the SeeShell Browser to start.
#If SeeShell Browser would take longer (e. g. very high CPU load) then the open command returns a timeout error

$comObj.open(10)

$comObj.Echo("This is a message from Powershell")

$i = $comObj.Play("Demo-Automate-Forms")

[System.Windows.Forms.MessageBox]::Show($i)
[System.Windows.Forms.MessageBox]::Show($comObj.GetLastError())
[System.Windows.Forms.MessageBox]::Show("Click OK to close the SeeShell Browser")

$comObj.Close(10)