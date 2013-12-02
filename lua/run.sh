#!/bin/sh

. ../common.sh

LUA=`which luajit2 2> /dev/null`
if [ -z "$LUA" ] ; then
  LUA=`which lua 2> /dev/null`
elif [ -n "$LUA" ] ; then
  display "Lua"
  echo "Using $LUA"
  $LUA estimate_pi.lua | tee -a ../output/lua.txt
  display "Lua"
fi
