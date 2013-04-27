# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dassets-sass/version"

Gem::Specification.new do |gem|
  gem.name        = "dassets-sass"
  gem.version     = Dassets::Sass::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.description = %q{Dassets engine for compiling Sass}
  gem.summary     = %q{Dassets engine for compiling Sass}
  gem.homepage    = "http://github.com/redding/dassets-sass"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("assert")

  gem.add_dependency("sass")
  gem.add_dependency("dassets")

end
