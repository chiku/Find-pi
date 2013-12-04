#!/bin/sh

. ../common.sh

IMPL="Java"
OUTPUT="../output/java.txt"

JAVAC=`which javac 2> /dev/null`
JAVA=`which java 2> /dev/null`

if [[ -n "$JAVAC" && -n "$JAVA" ]] ; then
  display $IMPL
  echo "Using $JAVAC and $JAVA"
  $JAVAC *.java | tee -a $OUTPUT
  $JAVA EstimatePi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
