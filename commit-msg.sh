#!/bin/sh

if ! cat $1 | grep -oqE '(feat|fix): [A-Z0-9]{2,4}-[A-Z0-9]{1,4} .{10,}' ; then
  echo 'bad commit name' 1>&2
  exit 1
fi

