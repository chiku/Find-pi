#!/bin/sh

. ../common.sh

IMPL="Ioke"
OUTPUT="../output/ioke.txt"

IOKE=`which ioke 2> /dev/null`

if [ -n "$IOKE" ] ; then
  display $IMPL
  echo "Using $IOKE"
  $IOKE estimate_pi.ik | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
