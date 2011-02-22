#!/usr/bin/env bash

set -e

source common_functions.sh

combos=( `cat test-combos.txt` )

reset_patches

# because of set -e, this will bail if git not clean
git_cleanliness || (echo "git not clean, bailing" ; exit 1)

for combo in ${combos[*]} ; do
    parse_combo $combo
    patch_up
    patch_down
done
