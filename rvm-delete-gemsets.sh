#!/usr/bin/env bash

set -e

source common_functions.sh

combos=( `cat test-combos.txt` )

for combo in ${combos[*]} ; do
    parse_combo $combo
    source rvm use $RUBY
    source rvm  --force gemset delete $GEMSET
done
