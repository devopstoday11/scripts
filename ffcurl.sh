#!/bin/bash

exec curl -A 'Mozilla/5.0 (X11; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0' -H 'Accept-Language: cs,en-US;q=0.7,en;q=0.3' -H "Referer: ${@:-1}" $@
