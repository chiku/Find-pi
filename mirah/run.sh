#!/bin/sh

. ../common.sh

MIRAHC=`which mirahc 2> /dev/null`
JAVA=`which java 2> /dev/null`
if [[ -n "$MIRAH" && -n "$JAVA" ]] ; then
  display "Mirah"
  echo "Using $MIRAH"
  GEM_HOME=$JRUBY_GEM_HOME $MIRAHC *.mirah | tee -a ../output/mirah.txt
  $JAVA EstimatePi | tee -a ../output/mirah.txt
  display "Mirah"
fi
