require 'assert'
require 'dassets/engine'
require 'dassets-sass'

class Dassets::Sass::Engine

  class BaseTests < Assert::Context
    desc "the Dassets::Sass engine"
    setup do
      @engine = Dassets::Sass::Engine.new
    end
    subject{ @engine }

    should "be a Dassets engine" do
      assert_kind_of Dassets::Engine, subject
      assert_respond_to 'ext', subject
      assert_respond_to 'compile', subject
    end

  end

end
