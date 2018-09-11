#
# The ZonalOCR macro demos these features: 
# 1. Read data from CSV
# 2. Send to macro via SetVariable
# 3. In the macro, open custom URL via {..} variable
# 4. Use the EXTRACT command for Zonal OCR
# 5. Save extracted data to CSV file
#
# To run, copy the "ZonalOCR.see" file to the SeeShell macro folder
# Typically this folder is at
# C:\Users\<your user name>\Documents\SeeShell.Browser\macros 
# Once there, the macro also shows up in the SeeShell Browser sidebar.
#
# Script version: V1.3, 2018-08-12
#



$pathinput = "input.txt"
$pathoutputok = "data.csv"
$pathoutputerror = "nodata.txt"
 
#LIST (for testing, instead of CSV file)
#$names =  "AAPL", "XYZ", "BA"


#READ list from CSV file
$list = Import-csv -path $pathinput -header company
Write-Host $name "Import data"
foreach($line in $list)
{ 
      Write-Host $line.company
}
$names = $list.company
# END CSV import


Write-Host "Number of elements: " $names.Count
Foreach ($name in $names) {
    Write-Host $name 
}

$line = "hjkjh"

$line | Add-Content $pathoutputerror

#Create SeeShell Object
$SeeShell = new-object -ComObject SeeShell.Browser

#Open SeeShell Browser
$i = $SeeShell.open(1)  #1 = true = open NEW instance
#$i = $SeeShell.open(0)  0 = false = connect to already running instance of SeeShell

foreach ($name in $names) {

    Write-Host "START " $name "---------------------" 

    $i = $SeeShell.echo("Name="+$name)
    $i = $SeeShell.setVariable("name", $name)
    $i = $SeeShell.play("zonalocr")

    #Write data to file

    If ($i -gt 0) #Return value > 0 means: All ok (no error)
    {
        Write-Host $name "=OK" 

        #we have data
        $allData = $SeeShell.GetExtractImageData()
 #      Write-Host $name " DATA => " $allData 

         #Convert to CSV format
        $allData = $allData.replace("[NEWLINE]", ",")
        $allData = $allData.replace("[DATA]", "next line,")
        $line = $name + "," + $allData

        #Output
        $line | Add-Content $pathoutputok
    }
    else
    {
        #log the misses in 2nd file
        Write-Host "Error: " $name  "=> Return value: " $i "Error text: " $SeeShell.GetLastError()
        $line = $name 
        $line | Add-Content $pathoutputerror
    }
}

$i = $SeeShell.echo("Done!")
#Close the SeeShell Browser
$i = $SeeShell.close();