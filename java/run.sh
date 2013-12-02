#!/bin/sh

. ../common.sh

JAVAC=`which javac 2> /dev/null`
JAVA=`which java 2> /dev/null`
if [[ -n "$JAVAC" && -n "$JAVA" ]] ; then
  display "Java"
  echo "Using $JAVAC and $JAVA"
  $JAVAC *.java | tee -a ../output/java.txt
  $JAVA EstimatePi | tee -a ../output/java.txt
  display "Java"
fi
