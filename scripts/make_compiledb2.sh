#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

# will produce compilation database file
#[
#  { "directory": "/home/user/llvm/build",
#    "command": "/usr/bin/clang++ -Irelative -DSOMEDEF=\"With spaces, quotes and \\-es.\" -c -o file.o file.cc",
#    "file": "file.cc" },
#  ...
#]

echo '[' > compile_commands.json

b clean; b -v -n update |& grep ^clang | grep " -c " | \
    while read COMMAND;
    do
        echo '{ "directory": "'$(pwd)'",'
        echo '  "command": "'$COMMAND'",'
        FILE=$( echo $COMMAND | awk '{print $NF}' )
        echo '  "file": "'$FILE'" }',
    done >> compile_commands.json

echo ']' >> compile_commands.json
