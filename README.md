# Dassets::Sass

Dassets [engine](https://github.com/redding/dassets#compiling) for compiling [Sass](http://sass-lang.com/) css sources.

## Usage

Register the engine:

```ruby
# in config/assets.rb
require 'dassets'
require 'dassets-sass'

Dassets.configure do |c|

  c.source "/path/to/assets") do |s|
    # register for `scss` syntax
    s.engine 'scss', Dassets::Sass::Engine, :syntax => 'scss'

    # register for `sass` syntax
    s.engine 'sass', Dassets::Sass::Engine, :syntax => 'sass'

    # by default `:nested` output style is used, but you can
    # specify a custom style (http://sass-lang.com/documentation/file.SASS_REFERENCE.html#output_style)
    s.engine 'scss', Dassets::Sass::Engine, {
      ...
      :output_style => :compressed
    }

    # by default `/path/to/assets` is in the load paths, but
    # you can specify additional custom load paths to use with `@import`s
    s.engine 'scss', Dassets::Sass::Engine, {
      ...
      :load_paths => ['/custom/load/path']
    }
  end

end
```

Put your `.scss` and `.sass` source files in your source path.  Dassets will compile their content using Sass, switch their extension to `.css`, and write the output to the output path.

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
