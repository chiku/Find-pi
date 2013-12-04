#!/bin/sh

. ../common.sh

IMPL="FreeBASIC"
OUTPUT="../output/basic.txt"

FBC=`which fbc 2> /dev/null`

if [ -n "$FBC" ]
then
  display $IMPL
  echo "Using $FBC"
  $FBC -x estimate_pi *.bas | tee -a $OUTPUT
  ./estimate_pi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
