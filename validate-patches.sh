#!/usr/bin/env bash

set -e

source common_functions.sh

combos=( `cat test-combos.txt` )

reset_patches

# because of set -e, this will bail if git not clean
git_cleanliness || (echo "git not clean, bailing" ; exit 1)

rm -f gemset-list.txt

for combo in ${combos[*]} ; do
    parse_combo $combo
    echo $RUBY@$GEMSET >> gemset-list.txt
    patch_up
    patch_down
done
