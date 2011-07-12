#!/bin/sh

echo "****** RUBY ******"
cd ruby
ruby estimate_pi.rb
cd ..
echo "****** RUBY ******"

echo ""
echo ""

echo "****** C++ ******"
cd c++
g++ estimate_pi.cpp -o estimate_pi
./estimate_pi
cd ..
echo "****** C++ ******"

ruby create_markdown.rb

