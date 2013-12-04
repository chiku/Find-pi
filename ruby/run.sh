#!/bin/sh

. ../common.sh

IMPL="Ruby"
OUTPUT="../output/ruby.txt"

RUBY=`which ruby 2> /dev/null`

if [ -n "$RUBY" ] ; then
  display $IMPL
  echo "Using $RUBY"
  $RUBY estimate_pi.rb | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
