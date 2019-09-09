#!/bin/sh

exec adb exec-out "tar -zpcf - \"$@\" 2>/dev/null"
