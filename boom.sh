#!/bin/bash

if [ -n "$1" ]; then
  name="$1"
else
  read -p "What's your name? " name
fi

echo "Hello $name"