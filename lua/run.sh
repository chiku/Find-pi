#!/bin/sh

. ../common.sh

IMPL="Lua"
OUTPUT="../output/lua.txt"

LUA=`which luajit2 2> /dev/null`
if [ -z "$LUA" ] ; then
  LUA=`which luajit 2> /dev/null`
fi
if [ -z "$LUA" ] ; then
  LUA=`which lua 2> /dev/null`
fi

if [ -n "$LUA" ] ; then
  display $IMPL
  echo "Using $LUA"
  $LUA estimate_pi.lua | tee -a $OUTPUT
  display $IMPL
else
  skip $IMPL
fi
