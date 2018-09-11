set dist=%cd%\dist
set libs=%dist%\libs
set classpath=%libs%\ant-1.7.0.jar;%libs%\ant-launcher-1.7.0.jar;%libs%\asm-3.0.jar;%libs%\asm-commons-3.0.jar;%libs%\asm-tree-3.0.jar;%libs%\forms-1.1-preview.jar;%libs%\forms_rt-7.0.3.jar;%libs%\jacob-1.14.3.jar;%libs%\javac2-7.0.3.jar;%libs%\jdom-1.0.jar;%dist%\SeeShell-api-demo-com-1.0-SNAPSHOT.jar
"%JAVA_HOME%\bin\java" -Djava.library.path="%dist%\dlls" -classpath "%classpath%" com.SeeShell.demo.MainApp