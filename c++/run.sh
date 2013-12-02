#!/bin/sh

. ../common.sh

CXX=`which g++ 2> /dev/null`
if [ -n "$CXX" ] ; then
  display "C++"
  echo "Using $CXX"
  $CXX -O2 -I. *.cc -o estimate_pi | tee -a ../output/c++.txt
  ./estimate_pi | tee -a ../output/c++.txt
  display "C++"
fi
