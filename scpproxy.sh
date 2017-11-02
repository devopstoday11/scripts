#!/bin/sh

exec scp -o ProxyCommand="/usr/local/bin/connect -H localhost:3128 %h %p" $@
