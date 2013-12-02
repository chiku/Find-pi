#!/bin/sh

. ../common.sh

FBC=`which fbc 2> /dev/null`
if [ -n "$FBC" ]
then
  display "FreeBASIC"
  echo "Using $FBC"
  $FBC -x estimate_pi *.bas | tee -a ../output/basic.txt
  ./estimate_pi | tee -a ../output/basic.txt
  display "FreeBASIC"
else
  skip "FreeBASIC"
fi
