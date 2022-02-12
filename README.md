# Frampt

File uploader writtin Ruby. Kind of like [pomf](https://github.com/pomf/pomf)
or [uguu](https://github.com/nokonoko/uguu)

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

Set a `SESSION_COOKIE_SECRET` env var for Rack and run `./bin/serve`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gnotclub/frampt.
