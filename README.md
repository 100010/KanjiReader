# KanjiReader

KanjiReader allows you to read part of word written in Kanji with ruby

## Installation

Add this line to your application's Gemfile:

```ruby
echo "gem 'KanjiReader'" >> Gemfile && bundle
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install KanjiReader

## Usage

First, you have to get application_id to use yahoo api.
you can get it from [here](https://e.developer.yahoo.co.jp/register)

after you get application_id from website, you can use like

```ruby
str = KanjiReader::Perform.new(YOUR_APPLICATION_ID, "翻車魚")
str.kanji #=> "翻車魚"
str.roman #=> "manbou"
str.hiragana #=> 'まんぼう'
str.katakana #=> 'マンボウ'
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/KanjiReader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
