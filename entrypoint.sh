#!/bin/sh -l

OIFS="$IFS"
IFS=$'\n'
for IN in `find $1 -iname "*.txt" -o -iname "*.txt"`
do
OUT=${IN/$1/$3}
DIR=$(dirname $OUT)
mkdir -p "$DIR"
if [ ! -f $OUT ]; then
echo "Removing duplicate $IN"
convert sort $IN | uniq  $2  $OUT
else
echo "Removed already."
fi

done
IFS="$OIFS"
