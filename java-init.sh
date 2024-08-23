#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "$0 [name]"
    exit 1
fi

NAME_GIVEN=$1

mkdir src
echo -e "Manifest-Version: 1.5\nMain-Class: $NAME_GIVEN\nCreated-By: 1.0 (java-init)" > MANIFEST.MF

echo -e "public class $NAME_GIVEN {\n\n    public static void main(String[] args) {\n\n    }\n\n}" > "src/$NAME_GIVEN.java"
echo -e "build:\n	javac -d src src/*.java\n	cd src; \\" > "Makefile"
echo -e "    jar cmvf ../MANIFEST.MF ../$NAME_GIVEN.jar *.class\n\nrun: build\n	java -jar $NAME_GIVEN.jar" >> "Makefile"
