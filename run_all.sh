#!/bin/sh

rm */output.txt
rm */*.csv
rm output/*.markdown

echo "****** RUBY ******"
cd ruby
./estimate_pi.rb | tee output.txt
cd ..
echo "****** RUBY ******"

echo ""
echo ""

echo "****** C++ ******"
cd c++
g++ estimate_pi.cpp -o estimate_pi
./estimate_pi | tee output.txt
cd ..
echo "****** C++ ******"

ruby create_markdown.rb

