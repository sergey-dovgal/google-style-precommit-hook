x#!/usr/bin/env sh

VERSION=1.24.0
JARFILE=google-java-format-$VERSION-all-deps.jar

mkdir -p .cache
cd .cache
if [ ! -f $JARFILE ]
then
    curl -LJO "https://github.com/google/google-java-format/releases/download/v$VERSION/$JARFILE"
    chmod 755 $JARFILE
fi
cd ..

changed_java_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*java$" )
echo $changed_java_files
java -jar .cache/$JARFILE --replace $changed_java_files
