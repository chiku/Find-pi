#!/bin/sh

echo "****** RUBY ******"
cd ruby
ruby estimate_pi.rb
cd ..
echo "****** RUBY ******"

ruby create_markdown.rb
