#!/bin/bash

echo -e "Compiling..."
cd src/java
javac --release 8 -d ../../build/class org/example/Test.java
cd ../java9
javac --release 9 -d ../../build/class9 org/example/Test.java
cd ../..

echo -e "Creating multi-release jar file"
## To make this work, jar should be from jdk version 9 onwards
jar cvf build/test.jar -C build/class org --release 9 -C build/class9 org
