#!/usr/bin/env bash

set -e

source common_functions.sh

combos=( `cat test-combos.txt` )

reset_patches

# because of set -e, this will bail if git not clean
git_cleanliness || (echo "git not clean, bailing" ; exit 1)

for combo in ${combos[*]} ; do
    parse_combo $combo
    source rvm use $RUBY
    source rvm gemset use $GEMSET
    patch_up
    bundle install --local
    rake hobo:generate_taglibs
    rake test:integration
    source acceptance_test.sh
    patch_down
done

echo "ALL TESTS PASSED SUCCESSFULLY."
