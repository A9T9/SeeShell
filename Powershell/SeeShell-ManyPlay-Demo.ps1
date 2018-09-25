
$comObj = new-object -ComObject SeeShell #Desktop Automation
#or: $comObj = new-object -ComObject SeeShell.Browser #Web Automation

$comObj.open(10)

$comObj.Echo("Running Part 1")

$i = $comObj.Play("Demo-ManyPlay-Part1")

if ($i -lt 0) {
    [System.Windows.Forms.MessageBox]::Show("Error: "+ $i + $comObj.GetLastError())
}




$comObj.Echo("Running Part 2")
$i = $comObj.Play("Demo-ManyPlay-Part2")
if ($i -lt 0) {[System.Windows.Forms.MessageBox]::Show("Part 2 error: "+ $i + " " + $comObj.GetLastError())}

$comObj.Echo("Running Part 3")
$i = $comObj.Play("Demo-ManyPlay-Part3")
if ($i -lt 0) {[System.Windows.Forms.MessageBox]::Show("Part 3 error: "+ $i + " " + $comObj.GetLastError())}


[System.Windows.Forms.MessageBox]::Show("All done. Click OK to close the SeeShell Browser")

$comObj.Close(10)