#!/bin/sh

. ../common.sh

IMPL="JavaScript"
OUTPUT="../output/javascript.txt"

JAVASCRIPT=`which node 2> /dev/null`

if [ -n "$JAVASCRIPT" ] ; then
  display $IMPL
  echo "Using $JAVASCRIPT"
  $JAVASCRIPT estimate.pi.js | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
