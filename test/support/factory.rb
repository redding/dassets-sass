# frozen_string_literal: true

require "assert/factory"

module Factory
  extend Assert::Factory

  def self.scss
    "$blue: #3bbfce;\n"\
    "$margin: 16px;\n"\
    ".border {\n"\
    "  padding: $margin / 2;\n"\
    "  margin: $margin / 2;\n"\
    "  border-color: $blue;\n"\
    "}\n"
  end

  def self.scss_compiled
    ".border {\n"\
    "  padding: 8px;\n"\
    "  margin: 8px;\n"\
    "  border-color: #3bbfce; "\
    "}\n"
  end

  def self.sass
    "table.hl\n"\
    "  margin: 2em 0\n"\
  end

  def self.sass_compiled
    "table.hl {\n"\
    "  margin: 2em 0; "\
    "}\n"\
  end
end
