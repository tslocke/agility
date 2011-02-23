#!/usr/bin/env bash

# will split a line from test-combos.txt into RUBY, RAILS, DB, HOBO
function parse_combo {
    RUBY=`echo $1 | cut -f 1 -d ','`
    RAILS=`echo $1 | cut -f 2 -d ','`
    DB=`echo $1 | cut -f 3 -d ','`
    HOBO=`echo $1 | cut -f 4 -d ','`
    GEMSET="hobotest"
}

function echo_combo {
    echo -e "$RUBY\t$RAILS\t$DB\t$HOBO"
}

function patch_up {
    echo "switching to $RUBY,$RAILS,$DB,$HOBO"
    rm -f Gemfile.lock
    patch -p1 --merge < patches/$RUBY.patch
    patch -p1 --merge  < patches/$RAILS.patch
    patch -p1 --merge  < patches/$DB.patch
    patch -p1 --merge < patches/$HOBO.patch
    echo "$RUBY,$RAILS,$DB,$HOBO" > current-combo.txt
}

function patch_down {
    patch -p1 -R  --merge < patches/$HOBO.patch
    patch -p1 -R  --merge < patches/$DB.patch
    patch -p1 -R  --merge < patches/$RAILS.patch
    patch -p1 -R  --merge < patches/$RUBY.patch
    rm current-combo.txt
}

# run this function before running your first patch_up
function reset_patches {
    if test -e current-combo.txt ; then
        if git_cleanliness ; then
            rm current-combo.txt
        else
            parse_combo `cat current-combo.txt`
            patch_down
        fi
    fi
}


function git_cleanliness {
    ! git status --porcelain | grep -v "test-combos.txt" | grep -v "Gemfile" | grep "^ M"
}
