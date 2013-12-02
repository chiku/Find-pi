#!/bin/sh

. ../common.sh

RUBY=`which ruby 2> /dev/null`
if [ -n "$RUBY" ] ; then
  display "Ruby"
  echo "Using $RUBY"
  $RUBY estimate_pi.rb | tee -a ../output/ruby.txt
  display "Ruby"
fi
