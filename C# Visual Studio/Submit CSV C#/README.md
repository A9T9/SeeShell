# SeeShell Browser Submit CSV API Demo

V1.0 - September 11, 2018

Visual Studio demo for loading a CSV file in C# and sending the data to the SeeShell Browser. As always, the same demo could be used for SeeShell Desktop Automation by just changing the COM object reference from  "SeeShell.Browser" to "SeeShell".

The demo uses the "setVariable" command to send values to SeeShell:

https://a9t9.com/seeshell/docs#setvariable

Reading the data inside the calling script gives you full control over the CSV file format (e. g. with or without header) and of course it works with any other type of datasource as well, for example databases. 

Please note that you need to add a reference to "SeeShell.Browser.API.Connector.dll" to your project, and add 

- SeeShell.Browser.API.dll

- SeeShell.Browser.API.Connector.dll

to your binaries folder. In the demo project, this is already taken care of.


You can download the ZIP file directly. It contains the complete sample project.
