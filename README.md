# Frampt

File uploader writtin Ruby. Kind of like [pomf](https://github.com/pomf/pomf)
or [uguu](https://github.com/nokonoko/uguu).

I wrote this to teach myself [Sinatra](http://sinatrarb.com) and
[Stimulus](https://stimulus.hotwired.dev/) so code may be not good hehe.

### todo

- some bot prevention mechanism (recaptcha?)
- find a way to prevent bad stuff from being uploaded
- make sure JSON api works nicely for people

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'frampt'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install frampt

## Usage

Frampt uses [ActiveRecord](https://github.com/rails/rails/tree/main/activerecord) to store
information on what was uploaded and by who, and uses [sinatra](http://sinatrarb.com/)
to send HTTP messages. You can configure your database by modifying `config/database.yml`
and then running `rake db:setup`. Then, run `./bin/serve` to start rack. Frampt uses
the [Puma](https://puma.io/) HTTP server locally, because she is a cat.

Environment variables you should set are defined in `.env.example`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gnotclub/frampt.
