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

  # lock in to Sass 3.1 and up b/c this is earliest version implementing
  # the expected `Sass.compile` api:
  # https://github.com/nex3/sass/commit/332dd6945a8acd660719e0ea4eb48ae3a3ef9b38
  gem.add_dependency("sass", ["~> 3.1"])
  gem.add_dependency("dassets")

end
