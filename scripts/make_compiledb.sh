#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

b clean; b -v -n update --no-progress |& ~/.local/bin/compiledb
