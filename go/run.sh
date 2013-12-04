#!/bin/sh

. ../common.sh

IMPL="Go"
OUTPUT="../output/go.txt"

GO=`which go 2> /dev/null`

if [[ -n "$GO" ]] ; then
  display $IMPL
  echo "Using $GO"
  $GO build -o estimate_pi *.go | tee -a $OUTPUT
  ./estimate_pi | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
