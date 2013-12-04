#!/bin/sh

# Pull in PATH for commands
if [ -f ./loader ] ; then
  . ./loader
fi

display() {
  echo "\n\n****** $1 ******"
}

skip() {
  echo "\n\nSkipping $1"
}

try_language() {
  cd $1
  time ./run.sh
  cd ..
}

cleanup() {
  rm -f output/*.markdown
  rm -f output/*.txt
  rm -f output/*.csv
}
