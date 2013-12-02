#!/bin/sh

. common.sh

cleanup

try_language "C++"
try_language "java"
try_language "c"
try_language "go"

echo "\n\n"

./create_markdown.rb
