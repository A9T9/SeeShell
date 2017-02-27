Rem The command line below used the default paths for Kantu on English windows
Rem You need to change them to work for your installation

Rem The -ae switch tells Kantu to close after the script has been run


"C:\Program Files (x86)\Kantu\kantu.exe" C:\Users\[YOUR USER HERE]\Documents\Kantu\scripts\demo-contactus.xkts -ae

"C:\Program Files (x86)\Kantu\kantu.exe" C:\Users\[YOUR USER HERE]\Documents\Kantu\scripts\demo-selectbox.xkts -ae

 
Rem If the batch file should not wait for Kantu to complete the script and exit then use START "" 
Rem start "" "C:\Program Files (x86)\Kantu\kantu.exe" C:\Users\m\Documents\Kantu\scripts\demo-contactus.xkts -ae

pause
