#
# This script sends the URL to use to the SeeShell Browser
# by using setVariable
#
# Inside the macro we have: OPEN {myURL}


Write-Host "Hello SeeShell User!"

$url = "https://a9t9.com"

$comObj = new-object -ComObject SeeShell.Browser

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[System.Windows.Forms.MessageBox]::Show("Click OK to start SeeShell")

#30 in open (30) is the max time to wait for SeeShell to start.
#If SeeShell would take longer (e. g. very high CPU load) then the open command returns a timeout error

$comObj.open(30)

    $comObj.Echo("URL = " + $url)

    $iret = $comObj.setVariable("myURL", $url ) 
    $iret = $comObj.Play("open-URL", 300)

    #Check test return value
    If ($iret -eq 1 ) {
        $sret = "Macro completed OK (" +$iret + ")"
    }else{
        $sret = $comObj.GetLastError() + " (" +$iret + ")"
    }


    [System.Windows.Forms.MessageBox]::Show($sret)

    $sdate = Get-Date -Format g


    $comObj.Close(10)
