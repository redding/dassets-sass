# frozen_string_literal: true

require "sassc"
require "dassets/engine"
require "dassets-sass/version"

module Dassets::Sass
  def self.SASS
    "sass"
  end

  def self.SCSS
    "scss"
  end

  def self.NESTED
    "nested"
  end

  def self.EXPANDED
    "expanded"
  end

  def self.COMPACT
    "compact"
  end

  def self.COMPRESSED
    "compressed"
  end
end

class Dassets::Sass::Engine < Dassets::Engine
  def syntax
    (
      opts[:syntax] ||
      opts["syntax"] ||
      Dassets::Sass.SCSS
    ).to_s
  end

  def output_style
    (
      opts[:output_style] ||
      opts["output_style"] ||
      Dassets::Sass.NESTED
    ).to_s
  end

  def load_paths
    @load_paths ||=
      begin
        [opts["source_path"]] +
        [*(opts[:load_paths] || opts["load_paths"] || [])]
      end
  end

  def ext(_input_ext)
    "css"
  end

  def compile(input_content)
    SassC::Engine
      .new(
        input_content,
        syntax:     syntax.to_sym,
        style:      output_style.to_sym,
        load_paths: load_paths,
      )
      .render
  end
end
