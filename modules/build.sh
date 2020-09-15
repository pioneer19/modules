#!/bin/bash

clang++-10 -Wall -std=c++2a -fimplicit-modules -fimplicit-module-maps -c greetings.cpp -Xclang -emit-module-interface -o greetings.pcm
clang++-10 -Wall -std=c++2a -fimplicit-modules -fimplicit-module-maps -fprebuilt-module-path=. main.cpp greetings.cpp -o main
