# Baltimore Public Art Commons

Baltimore Public Art Commons is an open source platform to collect and
distribute information about public art and monuments throughout Charm City.

## Configuring Your Development Environment

The project is built using Ruby on Rails.  The following instructions assume
your system is configured to run Ruby, Rails, and its dependencies.

  1. Clone the project

  `git clone git@github.com:BaltimorePublicArtCommons/baltimore_public_art_commons.git`

  2. Install gems

  `bundle install`

  3. Copy database config

  `cp config/database.yml-example config/database.yml`

  *Make sure you enter your database credentials*

  4. Setup databases

  ```
  rake db:create:all
  rake db:migrate
  rake db:test:prepare
  ```

## Contributing

Contact the project organziers if you'd like to contribute to the project.
