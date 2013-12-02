#!/bin/sh

. ../common.sh

GO=`which go 2> /dev/null`
if [[ -n "$GO" ]] ; then
  display "Go"
  echo "Using $GO"
  $GO build -o estimate_pi *.go | tee -a ../output/go.txt
  ./estimate_pi | tee -a ../output/go.txt
  display "Go"
fi
