#!/bin/sh

rm -f output/*.markdown
rm -f output/*.txt
rm -f output/*.csv

echo "****** RUBY ******"
cd ruby
./estimate_pi.rb | tee ../output/ruby.txt
cd ..
echo "****** RUBY ******"

echo ""
echo ""

echo "****** C++ ******"
cd c++
g++ -I. *.cc -o estimate_pi
./estimate_pi | tee ../output/c++.txt
cd ..
echo "****** C++ ******"

./create_markdown.rb
