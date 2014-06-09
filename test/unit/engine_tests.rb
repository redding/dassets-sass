require 'assert'
require 'dassets-sass'

require 'dassets/engine'

class Dassets::Sass::Engine

  class UnitTests < Assert::Context
    desc "Dassets::Sass::Engine"
    setup do
      @engine = Dassets::Sass::Engine.new
    end
    subject{ @engine }

    should have_instance_method :syntax

    should "be a Dassets engine" do
      assert_kind_of Dassets::Engine, subject
      assert_respond_to 'ext', subject
      assert_respond_to 'compile', subject
    end

    should "default the syntax to `scss`" do
      assert_equal 'scss', Dassets::Sass::Engine.new.syntax
    end

    should "allow specifying the engine syntax using engine opts" do
      assert_equal 'sass', Dassets::Sass::Engine.new(:syntax => 'sass').syntax
    end

    should "transform any input extension to `css`" do
      assert_equal 'css', subject.ext('scss')
      assert_equal 'css', subject.ext('sass')
      assert_equal 'css', subject.ext('sassycss')
      assert_equal 'css', subject.ext('whatever')
    end

    should "compile any input content as Sass css" do
      assert_equal @factory.scss_compiled, subject.compile(@factory.scss)

      sass_engine = Dassets::Sass::Engine.new :syntax => 'sass'
      assert_equal @factory.sass_compiled, sass_engine.compile(@factory.sass)
    end

  end

end
