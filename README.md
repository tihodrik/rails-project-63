# HexletCode

HexletCode is a simple form generation DSL. Use it for generatng forms in sites' templates.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

    User = Struct.new(:id, :name, :job)

    user = User.new

    html = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end

    puts html
    
    # <form action="/users" method="post">
    #   <label for="name">Name</label>
    #   <input name="name" value="" type="text">
    #   <label for="job">Job</label>
    #   <textarea cols="20" rows="40" name="job"></textarea>
    #   <input type="submit" value="Create">
    # </form>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tihodrik/hexlet_code.

## Hexlet tests and linter status:
[![Actions Status](https://github.com/tihodrik/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/tihodrik/rails-project-63/actions)