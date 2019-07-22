# [OGTable](https://ogtable.bradyklein.com)

OGTable stands for "Open Gaming Table", and is a simple social network for organizing a tabletop gaming group, be it for roleplaying games like Dungeons and Dragons or for board games, like Ticket to Ride, or Risk.

## Making edits

Feel free to fork and make any PRs to the site, if you're interested in helping to develop features. I currently have no plans to expand this much, beyond the base functionality, but that doesn't mean that you can't! Also, this is licensed under the MIT license, so pretty much the only thing you can't do is make a closed source verison.

Also, credit to the Ruby on Rails tutorial by Michael Hartl. Some of the code in here is thanks to his tutorial, so I am including this license here in the README.

```
THE BEERWARE LICENSE (Revision 42)

Michael Hartl wrote this code. As long as you retain this notice you can do
whatever you want with this stuff. If we meet some day, and you think this
stuff is worth it, you can buy me a beer in return.
```

## Running the project

Though the actual site is hosted on Heroku, you can run this website locally. The following assumes you have ruby installed, as well as rubygems and bundler. To do so, do the following:

```
git clone https://github.com/bklein18/ogtable.git
cd ogtable
bundle install
rails s
```

## Running the unit tests

You can run the tests by the following:

```
rails test
# use the following to run just the integration tests
rails test:integration
```

You can use the `test:#{NAME}` configuration to run different kinds of tests, including integration and unit tests.
