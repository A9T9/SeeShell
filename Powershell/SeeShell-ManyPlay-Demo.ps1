#
#
# This script shows how to concatenate many play commands.
#
# For the demo we splitted the Demo-Automate-Forms macro in 3 parts.
# Part 2 continues where Part 1 stopped, etc.
# 
# Typically this concept is used to split a complex task in several sub-macros, for example:
# - Login (= Part 1)
# - DoSomething (Part 2A), and/or run DoSomethingElse (Part 2B)
# - Logout (Part 3)
#
# The demo uses SeeShell Browser, but the same concept applies to SeeShell Desktop Automation as well.
#
# V1.0 Sep 13, 2018, Initial version


$comObj = new-object -ComObject SeeShell.Browser

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

# [System.Windows.Forms.MessageBox]::Show("Click OK to start the SeeShell Browser")

#10 in open (10) is the max time to wait for the SeeShell Browser to start.
#If SeeShell Browser would take longer (e. g. very high CPU load) then the open command returns a timeout error

$comObj.open(10)

$comObj.Echo("Running Part 1")
$i = $comObj.Play("Demo-ManyPlay-Part1")
if ($i -lt 0) {[System.Windows.Forms.MessageBox]::Show("Part 1 error: "+ $i + " " + $comObj.GetLastError())}

$comObj.Echo("Running Part 2")
$i = $comObj.Play("Demo-ManyPlay-Part2")
if ($i -lt 0) {[System.Windows.Forms.MessageBox]::Show("Part 2 error: "+ $i + " " + $comObj.GetLastError())}

$comObj.Echo("Running Part 3")
$i = $comObj.Play("Demo-ManyPlay-Part3")
if ($i -lt 0) {[System.Windows.Forms.MessageBox]::Show("Part 3 error: "+ $i + " " + $comObj.GetLastError())}


[System.Windows.Forms.MessageBox]::Show("All done. Click OK to close the SeeShell Browser")

$comObj.Close(10)