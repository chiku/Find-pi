#!/bin/sh

rm -f */run.txt
rm -f */output/*.csv
rm -f output/*.markdown

echo "****** RUBY ******"
cd ruby
./estimate_pi.rb | tee output/run.txt
cd ..
echo "****** RUBY ******"

echo ""
echo ""

echo "****** C++ ******"
cd c++
g++ -I. *.cc -o estimate_pi
./estimate_pi | tee output/run.txt
cd ..
echo "****** C++ ******"

ruby create_markdown.rb

