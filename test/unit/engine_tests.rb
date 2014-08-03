require 'assert'
require 'dassets-sass'

require 'dassets/engine'

class Dassets::Sass::Engine

  class UnitTests < Assert::Context
    desc "Dassets::Sass::Engine"
    setup do
      @lp1 = '/a-load-path-1'
      @lp2 = '/a-load-path-2'
      @engine = Dassets::Sass::Engine.new
    end
    subject{ @engine }

    should have_imeths :syntax, :load_paths

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

    should "default the load paths to be just the source path" do
      assert_equal [subject.opts['source_path']], subject.load_paths
    end

    should "allow specifying custom load paths, always including the source path" do
      engine = Dassets::Sass::Engine.new(:load_paths => @lp1)
      assert_includes @lp1, engine.load_paths
      assert_includes subject.opts['source_path'], engine.load_paths

      engine = Dassets::Sass::Engine.new('load_paths' => [@lp1])
      assert_includes @lp1, engine.load_paths
      assert_includes subject.opts['source_path'], engine.load_paths

      engine = Dassets::Sass::Engine.new('load_paths' => [@lp1, @lp2])
      assert_includes @lp1, engine.load_paths
      assert_includes @lp2, engine.load_paths
      assert_includes subject.opts['source_path'], engine.load_paths
    end

    should "transform any input extension to `css`" do
      assert_equal 'css', subject.ext('scss')
      assert_equal 'css', subject.ext('sass')
      assert_equal 'css', subject.ext('sassycss')
      assert_equal 'css', subject.ext('whatever')
    end

    should "use its syntax and load paths when compiling" do
      compiled_with_options = false
      input = @factory.sass
      syntax = :sass
      sass_engine = Dassets::Sass::Engine.new({
        :syntax => syntax,
        :load_paths => [@lp1]
      })
      load_paths = sass_engine.load_paths

      Assert.stub(::Sass, :compile).with(input, {
        :syntax => syntax,
        :load_paths => load_paths
      }){ compiled_with_options = true }

      sass_engine.compile(input)
      assert_true compiled_with_options
    end

    should "compile any input content as Sass css" do
      assert_equal @factory.scss_compiled, subject.compile(@factory.scss)

      sass_engine = Dassets::Sass::Engine.new :syntax => 'sass'
      assert_equal @factory.sass_compiled, sass_engine.compile(@factory.sass)
    end

  end

end
