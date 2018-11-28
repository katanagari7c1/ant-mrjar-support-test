# Ant task multi-release jar support
 
To execute the test, just run the following:
```
ant -f ant-test.xml
```

This will build the multi-release jar with a pre-Java9 and post-Java9 implementation of a Task class,
then it compiles a TestTask class that uses this jar and executes it as an ant task.

In the output you should see something similar of the following:
```
Buildfile: /home/user/Projects/ant-mrjar-support-test/ant-test.xml
     [echo] Apache Ant(TM) version 1.10.5 compiled on July 10 2018
     [echo] Running with Java version: 11

build.mrjar:
     [exec] Compiling...
     [exec] Creating multi-release jar file
     [exec] added manifest
     [exec] adding: org/(in = 0) (out= 0)(stored 0%)
     [exec] adding: org/example/(in = 0) (out= 0)(stored 0%)
     [exec] adding: org/example/Test.class(in = 410) (out= 294)(deflated 28%)
     [exec] adding: META-INF/versions/9/org/(in = 0) (out= 0)(stored 0%)
     [exec] adding: META-INF/versions/9/org/example/(in = 0) (out= 0)(stored 0%)
     [exec] adding: META-INF/versions/9/org/example/Test.class(in = 432) (out= 314)(deflated 27%)

build.task:
    [javac] Compiling 1 source file to /home/user/Projects/ant-mrjar-support-test/build/task

build.java:
    [javac] Compiling 1 source file to /home/user/Projects/ant-mrjar-support-test/build/java

run.task:
 [testTask] Executing Java8 Task
     [echo] ========================================
     [echo] Now using the same jar in a jvm process
     [echo] ========================================
     [java] Executing Java9+ Task. MRJAR is supported!

BUILD SUCCESSFUL
Total time: 2 seconds
```

In this execution we can see we're running ant 1.10.5 with Java 11, however
the ant classloader loads the Java 8 version of Test.class in the jar instead
of the one included for Java 9+. Meanwhile the JVM process loads the correct version
of Test.class.