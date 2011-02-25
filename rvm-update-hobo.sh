#!/usr/bin/env bash

set -e

source common_functions.sh

rubies=( `cat test-combos.txt  | cut -f 1 -d ,  | sort | uniq` )
hobos=( `cat test-combos.txt  | cut -f 4 -d ,  | sort | uniq | grep "$1"` )

reset_patches

# because of set -e, this will bail if git not clean
git_cleanliness || (echo "git not clean, bailing" ; exit 1)

for ruby in ${rubies[*]} ; do
    for hobo in ${hobos[*]}; do
        combos=(`cat test-combos.txt | grep $ruby | grep $hobo`)
        parse_combo $combos   # $combos is just first element of array.
        source rvm use $RUBY
        source rvm gemset create $GEMSET
        source rvm gemset use $GEMSET
        gem install bundler --no-rdoc --no-ri   # just in case
        patch_up
        bundle update
        patch_down
    done
done
