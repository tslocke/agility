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

Agility is also used to test the [Hobo
framework](http://www.hobocentral.net).  If you wish to run the tests,
edit _config/selenium.yml_ to set the path to your web browser of
choice.  Then you should be able to run the tests:

    script/server -e test -p 3001 &
    rake test:acceptance

The *master* branch of agility is designed to accompany the tutorial.
The *test* branch diverges slightly to enable additional tests.  The
*contrib-test* branch tests the
[hobo-contrib](http://github.com/bryanlarsen/hobo-contrib/tree/master)
plugin.

### Communicating Problems 

If you have a question you wish to post to the [mailing
list](http://groups.google.com/group/hobousers) or a bug you wish to
post to [the Hobo bug tracker](http://hobo.lighthouseapp.com/),
Agility can be very useful as a base application.  Try and reproduce
your problem using agility, and post an illustrative code fragment.
