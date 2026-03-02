#!/bin/bash

DIR="/" # the directory that will be nuked

find "$DIR" -type f -print0 | xargs -0 shred -v -n 20 -z -u

rm -r "$DIR"
