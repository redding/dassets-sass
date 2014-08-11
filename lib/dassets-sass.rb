require 'sass'
require 'dassets/engine'
require "dassets-sass/version"

module Dassets::Sass

  class Engine < Dassets::Engine

    def syntax
      (self.opts[:syntax] || self.opts['syntax'] || 'scss').to_s
    end

    def output_style
      (self.opts[:output_style] || self.opts['output_style'] || 'nested').to_s
    end

    def load_paths
      @load_paths ||= ([self.opts['source_path']] +
                       [*(self.opts[:load_paths] || self.opts['load_paths'] || [])])
    end

    def ext(input_ext)
      'css'
    end

    def compile(input_content)
      ::Sass.compile(input_content, {
        :syntax => self.syntax.to_sym,
        :style  => self.output_style.to_sym,
        :load_paths => self.load_paths
      })
    end

  end

end
