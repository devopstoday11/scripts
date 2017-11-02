#!/bin/bash
iv="6d6172736d6172736d6172736d617273" #"marsmarsmarsmars"
key="3031327334356d3738633031326d3435" #"012s45m78c012m45"

cd `dirname "$0"`
echo "SOL Zephyr / z-i . k3a "
echo "(type &. when done)"

read -p "Host: " HOST
read -p "User: " USER

exec ipmiconsole -h $HOST -u $USER -P
