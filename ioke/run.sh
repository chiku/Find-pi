#!/bin/sh

. ../common.sh

IOKE=`which ioke 2> /dev/null`
if [ -n "$IOKE" ] ; then
  display "Ioke"
  echo "Using $IOKE"
  $IOKE estimate_pi.ik | tee -a ../output/ioke.txt
  display "Ioke"
fi
