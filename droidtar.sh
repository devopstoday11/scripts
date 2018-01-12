#!/bin/sh

exec adb exec-out "tar -zcf - $@ 2>/dev/null"
