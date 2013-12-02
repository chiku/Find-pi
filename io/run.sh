#!/bin/sh

. ../common.sh

IO=`which io 2> /dev/null`
if [ -n "$IO" ] ; then
  display "Io"
  echo "Using $IO"
  $IO EstimatePi.io | tee -a ../output/io.txt
  display "Io"
fi
