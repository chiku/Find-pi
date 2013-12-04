#!/bin/sh

. ../common.sh

IMPL="C++"
OUTPUT="../output/c++.txt"

CXX=`which g++ 2> /dev/null`

if [ -n "$CXX" ] ; then
  display $IMPL
  echo "Using $CXX"
  $CXX -O2 -I. *.cc -o estimate_pi | tee -a $OUTPUT
  ./estimate_pi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
