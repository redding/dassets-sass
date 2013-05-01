require 'assert'
require 'fileutils'
require 'dassets'
require 'dassets-sass'

module Dassets::Sass

  class DigestScssTests < Assert::Context
    desc "digesting a scss source file with the sass engine registered"
    setup do
      @source_file = File.join(Dassets.config.source_path, "from_scss.scss")
      File.open(@source_file, 'w'){ |f| f.write(@factory.scss) }
      @output_file = File.join(Dassets.config.output_path, "from_scss.css")
      @exp_output_content = @factory.scss_compiled

      FileUtils.rm_f @output_file
    end

    should "produce a css file with the source scss compiled to css" do
      assert_file_exists @source_file
      assert_not_file_exists @output_file
      Dassets.digest_source_files

      assert_file_exists @output_file
      assert_equal @exp_output_content, File.read(@output_file)
    end

  end

  class DigestSassTests < Assert::Context
    desc "digesting a sass source file with the sass engine registered"
    setup do
      @source_file = File.join(Dassets.config.source_path, "from_sass.sass")
      File.open(@source_file, 'w'){ |f| f.write(@factory.sass) }
      @output_file = File.join(Dassets.config.output_path, "from_sass.css")
      @exp_output_content = @factory.sass_compiled

      FileUtils.rm_f @output_file
    end

    should "produce a css file with the source sass compiled to css" do
      assert_file_exists @source_file
      assert_not_file_exists @output_file
      Dassets.digest_source_files

      assert_file_exists @output_file
      assert_equal @exp_output_content, File.read(@output_file)
    end

  end

end
