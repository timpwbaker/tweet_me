# twitTWOO
## About
twitTWOO is a revolutionary new service where users can send messages of 150
characters or less, either anonymously or publicly, that appear in chronological
order on the timeline.

You can write messages, delete messages (anyone's, including your own) and add
images.

Think of it as the online version of screaming into the void.

## The application

The application uses rails 5.1 and a postgres db.

Postgres installation guides can be found here:
https://wiki.postgresql.org/wiki/Detailed_installation_guides

To run:

    bundle install
    bundle exec rails db:test:prepare
    bundle exec rails db:migrate
    bundle exec rails db:test:prepare
    rails s

visit localhost:3000

Tests are Capybara and RSpec, run them as follows:

    rspec

Rubocop holds the style guide, and is run using: 

    rubocop


