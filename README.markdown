
### Testing Hobo

The *master* branch of agility is set up to test Hobo 1.0.X with Ruby
1.8.7, Rails 2.2.2, sqlite3 and Firefox on Linux.   The `patches`
directory may be used to modify any of these assumptions.  For
example, if you wish to test Rails 2.3.11 and Hobo 1.1, type

    # patch -p1 --merge < patches/rails-2.3.11.patch
    # patch -p1 --merge < patches/hobo-1.1.patch

Currently the only meaningful tests here are Webrat (aka integration) and
Selenium (aka acceptance) tests.   The unit & functional tests run,
but don't contain any useful tests -- the unit tests for Hobo are in
Hobo itself.

Integration tests should run with a simple `rake test:integration`
after you've done the standard `bundle install` and `rake db:migrate`.
You may also need to do `rake hobo:generate_taglibs` if you've never
run agility in the development environment.

To run the tests under mysql, copy `config/database.yml.mysql.sample`
to `config/database.yml.mysql`.  DO NOT TOUCH `config/database.yml`
directly.  Instead run

    # patch -p1 --merge < patches/mysql.patch

Acceptance tests require a running server and a working browser, so
are more difficult to run.  To make this easier, we've included an
`acceptance_test.sh` that you can run and/or examine.  You may have to
tweak `config/selenium.yml` if the test has trouble contacting your
browser.

Note that you'll probably want to tweak the hobo definition in
`Gemfile` and then run `bundle update hobo` to test your branch of
Hobo rather than the stock version, which has already been tested.

## Testing on multiple versions of Ruby and Rails

We regularly test Hobo against many versions of Ruby and Rails.  All
the combinations that are tested are listed in `test-combos.txt`.  If
you want to do the same, here's some instructions.

The first thing you should do is to trim down `test-combos.txt` so
that it doesn't take several hours to run.  Once you have things
figured out you can add more combinations into `test-combos.txt`.

The other first thing you should do is to make sure that `rake
test:integration` and `./acceptance_test.sh` work for every database
you're testing against.

### Install RVM & the Rubies

To make testing different versions of Ruby and different sets of gems
easy, this environment uses the awesome tool
[rvm](http://rvm.beginrescueend.com/).

Install rvm as per instructions, and then install the rubies.  You'll
probably want to install some libraries and dependencies before the
rubies.

So it might go something like this after rvm is installed:

    rvm notes
    # cut and paste from the above output.  On Ubuntu this would be:
    aptitude install curl sun-java6-bin sun-java6-jre sun-java6-jdk
    aptitude install build-essential bison openssl libreadline5 libreadline5-dev curl git zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev

    rvm package install readline
    rvm package install openssl
    rvm package install iconv
    rvm package install zlib

    # this is only 2 of the rubies listed in test-combos.txt, but it's enough to start
    rvm install 1.8.7-p249
    rvm install 1.9.2-p136 -C --with-readline-dir=$rvm_path/usr

You also have to have the mysql server installed for some of the
combos, and you need to be able to build the mysql gem.  For example,
on Ubuntu, you should probably have these packages installed:
build-essential ruby-full libsqlite3-dev mysql-server mysql-client
libmysql-ruby libmysqlclient-dev  libxslt-dev libxml2-dev 
libreadline-dev.

### Create the gemsets

For test purposes we install our gems into a separate gemset for each
ruby so we do not pollute your global gemsets.   This gemset will be
called hobotest.

Create all the gemsets and let bundler populate them

    rvm use 1.8.7   # just making sure rvm is initialized
    ./rvm-create-gemsets.sh

This will fail if your git is not clean.

You can rerun `rvm-create-gemsets.sh` whenever you've updated any
dependencies.

If the only dependency that's been updated is hobo, you can run
`rvm-update-hobo.sh`, which runs quicker.

### Run the tests

    ./test-all-combos.sh

You can filter the tests, which just does a grep in test-combos.txt.  A few
useful examples:

    ./test-all-combos.sh hobo-1.0
    ./test-all-combos.sh jruby        # tests both jruby's
    ./test-all-combos.sh jruby-1.5.1
    ./test-all-combos.sh 1.8.7
    ./test-all-combos.sh ruby-1.8.7-p249,rails-2.2.2,sqlite3,hobo-1.0

If you test with IE6/7, the first test "Autocomplete and contributors"
will fail.  This is a problem with the test, not Hobo.  The second test
"Editors" is flaky.   In both cases the problem is properly waiting
for actions to complete before continuing the test.

On other browsers, the first two Selenium tests will occasionally
fail.  These are timing errors.  This happens infrequently enough that
increasing the margins isn't worth the slowdown.   If you are
experiencing consistent failures on any test, please report it.

