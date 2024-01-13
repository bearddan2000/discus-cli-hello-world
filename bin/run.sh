#! /bin/bash

FILE=Main && bin/ddc -make $FILE.ds 1>&2 \
    && ./$FILE