Rem The command line below used the default paths for SeeShell on English windows
Rem You need to change them to work for your installation

Rem The -ae switch tells SeeShell to close after the script has been run


Rem Desktop Automation
"C:\Program Files (x86)\SeeShell\SeeShell.exe" C:\Users\[YOUR USER HERE]\Documents\SeeShell\macros\test.see -ae

Rem Web Automation - SeeShell Browser
"C:\Program Files (x86)\SeeShell.Browser\SeeShellBrowser.exe" C:\Users\[YOUR USER HERE]\Documents\SeeShell.Browsers\macros\test.see -ae
 
Rem If the batch file should not wait for SeeShell to complete the script and exit then use START "" 


pause
