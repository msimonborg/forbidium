# Forbidium

Filter hashes by setting  allowed or forbidden values for specific keys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'forbidium'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install forbidium

## Usage
```ruby
hash = { one: 'one', two: 'two' }

hash.forbid(one: 'one') # => { two: 'two' }

hash.allow(one: 'two') # => { two: 'two' }

hash.allow(one: ['one', 'two']) # => { one: 'one', two: 'two' }

hash.forbid(one: ['one', 'two']) # => { two: 'two' }

hash.allow!(one: 'two') # => { two: 'two' }

hash.forbid!(two: 'two') # => {}

hash # => {}
```

## Platform support

Tested against:
* MRI 2.0.0
* MRI 2.1.10
* MRI 2.2.5
* MRI 2.3.0
* MRI 2.3.4
* MRI 2.4.1
* JRuby 9.1.6.0
* Rubinius 3.74
* JRuby HEAD
* MRI HEAD

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/msimonborg/forbidium.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
