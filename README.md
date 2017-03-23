# Kantu
Example code for working with the Kantu API. The api is ideal for more complex automation tasks, when a "linear" macro is not sufficient. The API allows you to control all Kantu functions from your favorite programming or scripting language. Note that some "ready to run" VBS and Powershell sample scripts are automatically installed with Kantu. Youn find them in the folder "This PC"/documents/kantu/api

Documentation: https://kantu.io/docs

API:  https://kantu.io/docs#api

FAQ: https://kantu.io/docs#faq

Kantu separates the linear website flow logic (the screenshot scripts) and the programming/scripting logic with this Scripting API. So for tasks like condidtional statements, use the API Scripting Interface. The PLAY command always returns detailed status and error information, and use can use this to base your IF/THEN/ELSE decisions on:

~~~~
IntegerReturnValue = objKantu.Play ("KantuMacro1")

if IntegerReturnValue = 1 then
  'Do something
  MsgBox "OK!"
else
  'error, do something else, like running another Kantu macro.
  IntegerReturnValue = objKantu.Play ("KantuMacro2")
end if
~~~~

Technically, the API is implemented as a Windows COM interface. So while this example uses the VBS/Visual Basic syntax,  you can use the Kantu COM object from any programming or scripting language on Windows.

