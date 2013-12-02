#!/bin/sh

. ../common.sh

GO=`which go 2> /dev/null`
if [[ -n "$GO" ]] ; then
  display "Go"
  echo "Using $GO"
  $GO build -o EstimatePi *.go | tee -a ../output/go.txt
  ./EstimatePi | tee -a ../output/go.txt
  display "Go"
fi
