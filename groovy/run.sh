#!/bin/sh

. ../common.sh

IMPL="Groovy"
OUTPUT="../output/groovy.txt"

GROOVY=`which groovy 2> /dev/null`

if [[ -n "$GROOVY" ]] ; then
  display $IMPL
  echo "Using $GROOVY"
  $GROOVY EstimatePi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
