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
g++ -02 -I. *.cc -o estimate_pi
./estimate_pi | tee ../output/c++.txt
cd ..
echo "****** C++ ******"

echo ""
echo ""

echo "****** PYTHON ******"
cd python
./estimate_pi.py | tee ../output/python.txt
cd ..
echo "****** PYTHON ******"

echo ""
echo ""

echo "****** JAVA ******"
cd java
javac *.java
java EstimatePi | tee ../output/java.txt
cd ..
echo "****** JAVA ******"

echo ""
echo ""

echo "****** IO ******"
cd io
./EstimatePi.io | tee ../output/io.txt
cd ..
echo "****** IO ******"

echo ""
echo ""

echo "****** Javascript ******"
cd javascript
./estimate.pi.js | tee ../output/javascript.txt
cd ..
echo "****** Javascript ******"

echo ""
echo ""

echo "****** C ******"
cd c
gcc -02 -I. -lm *.c -o estimate_pi
./estimate_pi | tee ../output/c.txt
cd ..
echo "****** C ******"

./create_markdown.rb

