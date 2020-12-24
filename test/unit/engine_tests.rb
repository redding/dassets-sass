require "assert"
require "dassets-sass"

require "dassets/engine"
require "sassc"

class Dassets::Sass::Engine
  class UnitTests < Assert::Context
    desc "Dassets::Sass::Engine"
    subject { unit_class }

    let(:unit_class) { Dassets::Sass::Engine }

    should "know its CONSTANTS" do
      assert_that(Dassets::Sass.SASS).equals("sass")
      assert_that(Dassets::Sass.SCSS).equals("scss")
      assert_that(Dassets::Sass.NESTED).equals("nested")
      assert_that(Dassets::Sass.EXPANDED).equals("expanded")
      assert_that(Dassets::Sass.COMPACT).equals("compact")
      assert_that(Dassets::Sass.COMPRESSED).equals("compressed")
    end
  end

  class InitTests < UnitTests
    desc "when init"
    subject { unit_class.new }

    setup do
      @lp1 = "/a-load-path-1"
      @lp2 = "/a-load-path-2"
    end

    should have_imeths :syntax, :output_style, :load_paths

    should "be a Dassets engine" do
      assert_that(subject).is_kind_of(Dassets::Engine)
      assert_that(subject).responds_to("ext")
      assert_that(subject).responds_to("compile")
    end

    should "default its settings" do
      assert_that(subject.syntax).equals(Dassets::Sass.SCSS)
      assert_that(subject.output_style).equals(Dassets::Sass.NESTED)
      assert_that(subject.load_paths).equals([subject.opts["source_path"]])
    end

    should "allow specifying a custom settings" do
      engine =
        Dassets::Sass::Engine.new(
          syntax:       Dassets::Sass.SASS,
          output_style: Dassets::Sass.COMPRESSED,
        )
      assert_that(engine.syntax).equals(Dassets::Sass.SASS)
      assert_that(engine.output_style).equals(Dassets::Sass.COMPRESSED)
    end

    should "allow specifying custom load paths, always including the source path" do
      engine = Dassets::Sass::Engine.new(load_paths: @lp1)
      assert_that(engine.load_paths).includes(@lp1)
      assert_that(engine.load_paths).includes(subject.opts["source_path"])

      engine = Dassets::Sass::Engine.new("load_paths" => [@lp1])
      assert_that(engine.load_paths).includes(@lp1)
      assert_that(engine.load_paths).includes(subject.opts["source_path"])

      engine = Dassets::Sass::Engine.new("load_paths" => [@lp1, @lp2])
      assert_that(engine.load_paths).includes(@lp1)
      assert_that(engine.load_paths).includes(@lp2)
      assert_that(engine.load_paths).includes(subject.opts["source_path"])
    end

    should "transform any input extension to `css`" do
      assert_that(subject.ext("scss")).equals("css")
      assert_that(subject.ext("sass")).equals("css")
      assert_that(subject.ext("sassycss")).equals("css")
      assert_that(subject.ext("whatever")).equals("css")
    end

    should "use its syntax, output style and load paths when compiling" do
      load_paths = [@lp1]
      sass_engine =
        Dassets::Sass::Engine.new(
          syntax:       Dassets::Sass.SASS,
          output_style: Dassets::Sass.COMPRESSED,
          load_paths:   load_paths,
        )

      render_spy =
        Assert.stub_spy(::SassC::Engine, :new, render: "rendered output")

      input  = @factory.sass
      output = sass_engine.compile(input)

      assert_that(output).equals("rendered output")
      assert_that(render_spy.new_called_with.pargs).equals([input])
      assert_that(render_spy.new_called_with.kargs)
        .equals(
          syntax:     Dassets::Sass.SASS.to_sym,
          style:      Dassets::Sass.COMPRESSED.to_sym,
          load_paths: ([sass_engine.opts["source_path"]] + load_paths),
        )
    end

    should "compile any input content as Sass CSS" do
      assert_equal @factory.scss_compiled, subject.compile(@factory.scss)

      sass_engine = Dassets::Sass::Engine.new(syntax: Dassets::Sass.SASS)
      assert_equal @factory.sass_compiled, sass_engine.compile(@factory.sass)
    end
  end
end
