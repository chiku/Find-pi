#!/bin/sh

. common.sh

cleanup

try_language "ruby"
try_language "C++"
try_language "python"
try_language "java"
try_language "io"
try_language "javascript"
try_language "c"
try_language "lua"
try_language "basic"
try_language "ioke"
try_language "mirah"
try_language "groovy"
try_language "go"

echo "\n\n"

./create_markdown.rb
