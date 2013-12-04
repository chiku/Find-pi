#!/bin/sh

. ../common.sh

IMPL="C"
OUTPUT="../output/c.txt"

CC=`which gcc 2> /dev/null`

if [ -n "$CC" ] ; then
  display $IMPL
  echo "Using $CC"
  $CC -O2 -I. -lm *.c -o estimate_pi | tee -a $OUTPUT
  ./estimate_pi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
