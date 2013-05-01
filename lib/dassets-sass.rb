require 'sass'
require 'dassets/engine'
require "dassets-sass/version"

module Dassets::Sass

  class Engine < Dassets::Engine

    def syntax
      (self.opts[:syntax] || self.opts['syntax'] || 'scss').to_s
    end

    def ext(input_ext)
      'css'
    end

    def compile(input_content)
      ::Sass.compile(input_content, :syntax => self.syntax.to_sym)
    end

  end

end
