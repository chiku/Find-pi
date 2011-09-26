#!/bin/sh

rm -f output/*.markdown
rm -f output/*.txt
rm -f output/*.csv

# Pull in PATH for commands
if [ -f ./loader ] ; then
  . ./loader
fi


display() {
  echo -e "\n\n****** $1 ******"
}


RUBY=`which ruby 2> /dev/null`
if [ -n "$RUBY" ] ; then
  display "Ruby"
  echo "Using $RUBY"
  cd ruby
  $RUBY estimate_pi.rb | tee -a ../output/ruby.txt
  cd ..
  display "Ruby"
fi

CXX=`which g++ 2> /dev/null`
if [ -n "$CXX" ] ; then
  display "C++"
  echo "Using $CXX"
  cd c++
  $CXX -O2 -I. *.cc -o estimate_pi | tee -a ../output/c++.txt
  ./estimate_pi | tee -a ../output/c++.txt
  cd ..
  display "C++"
fi

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
  cd python
  $PYTHON estimate_pi.py | tee -a ../output/python.txt
  cd ..
  display "Python"
fi

JAVAC=`which javac 2> /dev/null`
JAVA=`which java 2> /dev/null`
if [[ -n "$JAVAC" && -n "$JAVA" ]] ; then
  display "Java"
  echo "Using $JAVAC and $JAVA"
  cd java
  $JAVAC *.java | tee -a ../output/java.txt
  $JAVA EstimatePi | tee -a ../output/java.txt
  cd ..
  display "JAVA"
fi

IO=`which io 2> /dev/null`
if [ -n "$IO" ] ; then
  display "Io"
  echo "Using $IO"
  cd io
  $IO EstimatePi.io | tee -a ../output/io.txt
  cd ..
  display "Io"
fi

JAVASCRIPT=`which node 2> /dev/null`
if [ -n "$JAVASCRIPT" ] ; then
  display "JavaScript"
  echo "Using $JAVASCRIPT"
  cd javascript
  $JAVASCRIPT estimate.pi.js | tee -a ../output/javascript.txt
  cd ..
  display "JavaScript"
fi

CC=`which gcc 2> /dev/null`
if [ -n "$CC" ] ; then
  display "C"
  echo "Using $CC"
  cd c
  $CC -O2 -I. -lm *.c -o estimate_pi | tee -a ../output/c.txt
  ./estimate_pi | tee -a ../output/c.txt
  cd ..
  display "C"
fi

LUA=`which luajit2 2> /dev/null`
if [ -z "$LUA" ] ; then
  LUA=`which lua 2> /dev/null`
elif [ -n "$LUA" ] ; then
  display "Lua"
  echo "Using $LUA"
  cd lua
  $LUA estimate_pi.lua | tee -a ../output/lua.txt
  cd ..
  display "Lua"
fi

FBC=`which fbc 2> /dev/null`
if [ -n "$FBC" ] ; then
  display "FreeBasic"
  echo "Using $FBC"
  cd basic
  $FBC -x estimate_pi *.bas | tee -a ../output/basic.txt
  ./estimate_pi | tee -a ../output/basic.txt
  cd ..
  display "FreeBASIC"
fi

IOKE=`which ioke 2> /dev/null`
if [ -n "$IOKE" ] ; then
  display "Ioke"
  echo "Using $IOKE"
  cd ioke
  $IOKE estimate_pi.ik | tee -a ../output/ioke.txt
  cd ..
  display "Ioke"
fi


echo -e "\n\n"

./create_markdown.rb

