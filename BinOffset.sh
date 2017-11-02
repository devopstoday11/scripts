#!/bin/bash

# Script to find decimal offsets to all occurences of the entered pattern

# Usage: ./BinOffset.sh <pattern> [file]
# Pattern can contain escapes like \x2F

exec grep -obUaP $1 $2 | cut -d : -f 1
