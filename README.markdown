# SciRate 3

A rewrite of [Dave Bacon's](http://dabacon.org) SciRate in Ruby on Rails, previously developed by Dave Bacon and [Bill Rosgen](http://intractable.ca/bill/).

Currently deployed [here](https://scirate3.herokuapp.com/), with a testing version at [http://scirate.draftable.com/](https://scirate.draftable.com/).

## Contributing

We encourage contributions!

* You can submit a bug report [here](https://github.com/draftable/scirate3/issues).

* You can contribute to the code by sending a pull request on Github to the [canonical repository](https://github.com/draftable/scirate3).

* You can talk about scirate on our [mailing list](https://groups.google.com/forum/?fromgroups=#!forum/scirate) and about scirate development on the [development mailing list](https://groups.google.com/forum/?fromgroups=#!forum/scirate-dev).

## Setting up for development

You will need [Ruby 2.0](http://www.ruby-lang.org/en/) and a UNIX environment of some kind. Familiarity with [Rails 3](http://rubyonrails.org/) is recommended.

```shell
git clone git@github.com:draftable/scirate3
cd scirate3
bundle install
cp config/database.yml.example config/database.yml
```

Edit config/database.yml and enter your auth details for the development database.

```shell
rake db:setup
rake arxiv:scrape_categories
rails server
```

You should now have a working local copy of SciRate! However, you'll also want some papers to fiddle with.

## Populating the database

```shell
rake arxiv:oai_update
```

When run for the first time, this will download paper metadata from the last day. Subsequent calls will download all metadata since the last time. The production server runs this task every day to keep the database in sync.

## Enabling search

Due to the size of the arxiv database, we use a separate specialized search server. You'll need to install [Sphinx 2.1.4+](http://sphinxsearch.com/downloads/release/). Then run the rake tasks to build the initial search index and start the server:

```shell
rake ts:index
rake ts:start
```

## Testing

There is a fairly comprehensive series of unit and integration tests in `spec`. Running `rspec` in the top-level directory will attempt all of them.
