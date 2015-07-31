# Baltimore Public Art Commons

[![Build Status] (https://travis-ci.org/BaltimorePublicArtCommons/baltimore_public_art_commons.svg?branch=master)]
(https://travis-ci.org/BaltimorePublicArtCommons/baltimore_public_art_commons)
[![Code Climate](https://codeclimate.com/github/BaltimorePublicArtCommons/baltimore_public_art_commons.png)]
(https://codeclimate.com/github/BaltimorePublicArtCommons/baltimore_public_art_commons)

Baltimore Public Art Commons is an open source platform to collect and
distribute information about public art and monuments throughout Charm City.

## Configuring Your Development Environment

The project is built using Ruby on Rails.  The following instructions assume
your system is configured to run Ruby, Rails, and its dependencies.

  1. Clone the project

    `git clone git@github.com:BaltimorePublicArtCommons/baltimore_public_art_commons.git`
  
  2. Navigate to the project directory
  
    `cd baltimore_public_art_commons`

  3. Install gems

  `bundle install`

    *You will need to use the same version of Ruby as the project. The project's Ruby version is defined in the `.ruby-version` file.*
    
    *The install will fail if you don't have Postgres installed and running.*

  4. Copy database config

    `cp config/database.yml-example config/database.yml`

  and update the file with your database credentials.

  5. Setup databases

    ```
    rake db:create:all
    rake db:migrate
    rake db:test:prepare
    ```
    
    Optionally, load seed data.
    
    `rake db:seed`
    
  6. Set the application's secret_key_base
  
    From the command line, run `rake secret`. Then, copy the string output and set it as an environment variable called `bpac_secret_key_base`.
  
  7. Start the app!
  
    `rails s`

## Entity-Relationship Diagrams? We got'em!

To be able to re-generate erd.pdf (the Entity-Relationship Diagram),
you'll need to have GraphViz 2.2 or higher installed.

On Linux:
  `sudo apt-get install graphviz`

On OS X:
  `brew install graphviz`

Then,

```sh
    rake erd
```

## Contributing

Contact the project organziers if you'd like to contribute to the project.
