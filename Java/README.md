<h1>Java - Kantu API Demo App</h1>

The test app connects to the Kantu API COM interface to start Kantu, run a macro,
log the return code and then close Kantu. 

API documentation: https://a9t9.com/kantu/docs#api

## Prerequisites
- Kantu PRO or Kantu PRO Trial - https://a9t9.com/download
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
