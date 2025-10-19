#!/bin/bash
set -e

function print_error() {
    printf "\033[1;31m%s\033[0m" "$1"
}

function print_info() {
    printf "\033[1;32m%s\033[0m\n" "$1"
}

function exitf() {
    print_error "$1"
    exit 1
}

if [[ $1 == "--info" ]]; then
   print_info $1 || exitf $@
elif [[ $1 == "--error" ]]; then
   print_error $1 || exitf $@
elif [[ $1 == "--args-count" ]]; then
   print_error $# || exitf $@
elif [[ $1 == "--combine-args" ]]; then
   echo $@
   shift
   print_info $@
elif [[ $1 == "--sed" ]]; then
   echo "hello world"
   helloWorld=$(echo "hello world")
   echo $helloWorld | sed -E 's/(hello) (world)/\2 \1/'
fi