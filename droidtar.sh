#!/bin/sh

exec adb exec-out "su -c 'tar -zcf - $@' 2>/dev/null"
