# Agility

This is the source code to accompany the [Agility tutorial for
Hobo](http://cookbook.hobocentral.net/tutorials/agility).

Agility is a simple "Agile Development" application – Agility. The
application tracks projects which consist of a number of user
stories. Stories have a status (e.g. accepted, under development…) as
well as a number of associated tasks. Tasks can be assigned to users,
and each user can see a heads-up of all the tasks they’ve been
assigned to on their home page.

## Side purposes

Besides accompanying the tutorials, the Agility project has a couple
of additional purposes.

### Testing Hobo

The *master* branch of agility is set up to test Hobo 1.0.X with Ruby
1.8.7, Rails 2.2.2, sqlite3 and Firefox on Linux.   The `patches`
directory may be used to modify any of these assumptions.

Currently the only meaningful tests here are Webrat (aka integration) and
Selenium (aka acceptance) tests.   The unit & functional tests run,
but don't contain any useful tests -- the unit tests for Hobo are in
Hobo itself.

Integration tests should run with a simple `rake test:integration`
after you've done the standard `bundle install` and `rake db:migrate`.
You may also need to do `rake hobo:generate_taglibs` if you've never
run agility in the development environment.

Acceptance tests require a running server and a working browser, so
are more difficult to run.  To make this easier, we've included an
"acceptance_test.sh" that you can run and/or examine.  You may have to
tweak config/selenium.yml if the test has trouble contacting your
browser.

Note that you'll probably want to tweak the hobo definition in
`Gemfile` and then run `bundle update hobo` to test your branch of
Hobo rather than the stock version, which has already been tested.

### Communicating Problems 

If you have a question you wish to post to the [mailing
list](http://groups.google.com/group/hobousers) or a bug you wish to
post to [the Hobo bug tracker](http://hobo.lighthouseapp.com/),
Agility can be very useful as a base application.  Try and reproduce
your problem using agility, and post an illustrative code fragment.
