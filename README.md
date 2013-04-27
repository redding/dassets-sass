# DassetsSass

Dassets [engine](https://github.com/redding/dassets#compiling) for compiling [Sass](http://sass-lang.com/) css sources.

## Usage

Register the engine:

```ruby
# in config/assets.rb
require 'dassets'
require 'dassets-sass'

Dassets.configure do |c|
  c.root_path '/some/root/path'

  # register for `scss` syntax
  c.engine 'scss', Dassets::Sass::Engine, :syntax => 'scss'

  # register for `sass` syntax
  c.engine 'sass', Dassets::Sass::Engine, :syntax => 'sass'

end
```

Put your `.scss` and `.sass` source files in your source path and digest them.  Dassets will compile their content using Sass, switch their extension to `.css`, and write the output to the output path.

## Installation

Add this line to your application's Gemfile:

    gem 'dassets-sass'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dassets-sass

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
