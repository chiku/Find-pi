#!/bin/sh

. ../common.sh

JAVASCRIPT=`which node 2> /dev/null`
if [ -n "$JAVASCRIPT" ] ; then
  display "JavaScript"
  echo "Using $JAVASCRIPT"
  $JAVASCRIPT estimate.pi.js | tee -a ../output/javascript.txt
  display "JavaScript"
fi
