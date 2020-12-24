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
      self.opts[:syntax] ||
      self.opts["syntax"] ||
      Dassets::Sass.SCSS
    ).to_s
  end

  def output_style
    (
      self.opts[:output_style] ||
      self.opts["output_style"] ||
      Dassets::Sass.NESTED
    ).to_s
  end

  def load_paths
    @load_paths ||=
      (
        [self.opts["source_path"]] +
        [*(self.opts[:load_paths] || self.opts["load_paths"] || [])]
      )
  end

  def ext(input_ext)
    "css"
  end

  def compile(input_content)
    SassC::Engine
      .new(
        input_content,
        syntax:     self.syntax.to_sym,
        style:      self.output_style.to_sym,
        load_paths: self.load_paths,
      )
      .render
  end
end
