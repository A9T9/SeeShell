# SeeShell
Example code for working with the SeeShell API. The API is ideal for more complex automation tasks, when a "linear" macro is not sufficient. The API allows you to control all SeeShell functions from your favorite programming or scripting language. 

Note that some "ready to run" VBS and Powershell sample scripts are automatically installed with SeeShell. You find them in the folder 

- Desktop automation: "This PC"/"your user"/documents/SeeShell/API
- Web automation: "This PC"/"your user"/documents/SeeShell.Browser/API

If you deleted these files, or simply want to update them to the latest version, you can download and re-run a demo file installer. It does not include SeeShell, but only updates the demo macros and the demo VBS and Powershell scripts.

-  Desktop automation: [Download SeeShellDesktopDemoFiles-Setup.exe](http://download.a9t9.com/SeeShell/SeeShellDesktopDemoFiles-Setup.exe)
-  Web Automation: [Download SeeShellBrowserDemoFiles-Setup.exe](http://download.a9t9.com/SeeShell/SeeShellBrowserDemoFiles-Setup.exe)

Documentation: https://a9t9.com/SeeShell/docs

API:  https://a9t9.com/SeeShell/docs#api

FAQ: https://a9t9.com/SeeShell/docs#faq

**SeeShell separates the linear image flow logic (the screenshot scripts) and the programming/scripting logic with its Scripting API.** So for tasks like conditional statements, use the API Scripting Interface. The PLAY command always returns detailed status and error information, and use can use this to base your IF/THEN/ELSE decisions on:

~~~~
IntegerReturnValue = objSeeShell.Play ("Macro1.see")

if IntegerReturnValue = 1 then
  'Do something
  MsgBox "OK!"
else
  'error, do something else, like running another SeeShell macro.
  IntegerReturnValue = objSeeShell.Play ("Macro2.see")
end if
~~~~

Technically, the API is implemented as a Windows COM interface. So while this example uses the VBS/Visual Basic syntax,  you can use the SeeShell COM object from any programming or scripting language on Windows.

