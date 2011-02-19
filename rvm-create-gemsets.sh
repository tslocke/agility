#!/usr/bin/env bash

set -e

source common_functions.sh

combos=( `cat test-combos.txt` )

reset_patches

# because of set -e, this will bail if git not clean
git_cleanliness

for combo in ${combos[*]} ; do
    parse_combo $combo
    source rvm use $RUBY
    source rvm gemset create $GEMSET
    source rvm gemset use $GEMSET
    patch_up
    bundle update
    patch_down
done
