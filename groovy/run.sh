#!/bin/sh

. ../common.sh

GROOVY=`which groovy 2> /dev/null`
if [[ -n "$GROOVY" ]] ; then
  display "Groovy"
  echo "Using $GROOVY"
  $GROOVY EstimatePi | tee -a ../output/groovy.txt
  display "Groovy"
fi
