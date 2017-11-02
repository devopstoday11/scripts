#!/bin/sh

exec ssh -o ProxyCommand="/usr/local/bin/connect -H localhost:3128 %h %p" $@
