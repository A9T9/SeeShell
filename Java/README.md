<h1>Java - SeeShell API Demo App</h1>

The test app connects to the SeeShell API COM interface to start SeeShell, run a macro,
log the return code and then close SeeShell. TOf course, this demo can be used for the "SeeShell" object (= SeeShell Desktop Automation) and the "SeeShell.Browser" object of the SeeShell Chromium Browser for Web Automation. 

API documentation: https://a9t9.com/SeeShell/docs#api

## Prerequisites
- SeeShell PRO or SeeShell PRO Trial - https://a9t9.com/download
- JDK 1.8
- JAVA_HOME environment variable must be set and point to JDK folder, 
  (for example C:\Program Files\Java\jdk1.8.0_152)


## How to build
Execute command file `build.cmd`

## How to start
Execute command file `run.cmd` 

## Java COM Bridge (https://sourceforge.net/projects/jacob-project/)
* Java library jacob v1.14.3
* Native libraries downloaded into dist/dlls

All artifacts can be found here http://central.maven.org/maven2/net/sf/jacob-project/jacob/1.14.3/
