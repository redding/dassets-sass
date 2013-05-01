module Dassets::Sass

  module Factory
    module_function

    def scss
      "$blue: #3bbfce;\n"\
      "$margin: 16px;\n"\
      ".border {\n"\
      "  padding: $margin / 2;\n"\
      "  margin: $margin / 2;\n"\
      "  border-color: $blue;\n"\
      "}\n"
    end

    def scss_compiled
      ".border {\n"\
      "  padding: 8px;\n"\
      "  margin: 8px;\n"\
      "  border-color: #3bbfce; "\
      "}\n"
    end

    def sass
      "table.hl\n"\
      "  margin: 2em 0\n"\
    end

    def sass_compiled
      "table.hl {\n"\
      "  margin: 2em 0; "\
      "}\n"\
    end

  end

end
