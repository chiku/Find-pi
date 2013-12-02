#!/bin/sh

. ../common.sh

PYTHON=`which pypy 2> /dev/null`
if [ -z "$PYTHON" ] ; then
  PYTHON=`which python3 2> /dev/null`
elif [ -z "$PYTHON" ] ; then
  PYTHON=`which python 2> /dev/null`
elif [ -z "$PYTHON" ] ; then
  PYTHON=`which python2 2> /dev/null`
elif [ -n "$PYTHON" ] ; then
  display "Python"
  echo "Using $PYTHON"
  $PYTHON estimate_pi.py | tee -a ../output/python.txt
  display "Python"
fi
