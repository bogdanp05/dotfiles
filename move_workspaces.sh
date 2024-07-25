#!/bin/bash

#Passed arguments
while getopts ":o:" opt; do
    case $opt in
        o) arg_output="$OPTARG"
           echo "foo bar"
           echo "Output_foo: $arg_output"
        ;;
        \?) echo "Invalid option -$OPTARG" >&2 && exit 1
        ;;
    esac
done

# Passed output display name
echo "Output1: $arg_output"
OUTPUT="$arg_output" 

if ! [ "$OUTPUT" ]; then
    echo "No output display! Exiting..."
    exit 2
fi

eval i3-msg '[class=".*"]' move workspace to output ${OUTPUT}

