#!/bin/bash

# Check if a number (argument) is provided
if [ -z "$1" ]; then
  # If no argument is provided, run the command without the number
  erd
else
  # If an argument is provided, use it in the command
  erd -L "$1"
fi
