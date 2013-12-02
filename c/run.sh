#!/bin/sh

. ../common.sh

CC=`which gcc 2> /dev/null`
if [ -n "$CC" ] ; then
  display "C"
  echo "Using $CC"
  $CC -O2 -I. -lm *.c -o estimate_pi | tee -a ../output/c.txt
  ./estimate_pi | tee -a ../output/c.txt
  display "C"
fi
