## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nytimes_top_stories'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nytimes_top_stories

## Usage

This gem scrapes data from the New York Times website and presents the top stories
on the front page, here defined as those with a headline, byline, and summary.
Upon execution, the user will be presented with a numbered list of headlines for stories
meeting these criteria. Enter the number of the headline for more information
about the story, type "list" to scrape the site again, or type exit to terminate the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nytimes_top_stories.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
