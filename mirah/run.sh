#!/bin/sh

. ../common.sh

IMPL="Mirah"
OUTPUT="../output/mirah.txt"

MIRAHC=`which mirahc 2> /dev/null`
JAVA=`which java 2> /dev/null`

if [[ -n "$MIRAH" && -n "$JAVA" ]] ; then
  display $IMPL
  echo "Using $MIRAH"
  GEM_HOME=$JRUBY_GEM_HOME $MIRAHC *.mirah | tee -a $OUTPUT
  $JAVA EstimatePi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
