#!/bin/sh

. ../common.sh

IMPL="Io"
OUTPUT="../output/io.txt"

IO=`which io 2> /dev/null`

if [ -n "$IO" ] ; then
  display $IMPL
  echo "Using $IO"
  $IO EstimatePi.io | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
