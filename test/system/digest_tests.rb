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
      @compiled_file = File.join(Dassets.config.root_path, "public/from_scss-ffcdabded94a78022e9c92e06e311f69.css")
      @exp_compiled_content = @factory.scss_compiled

      FileUtils.rm_f @compiled_file
    end

    should "produce a css file with the source scss compiled to css" do
      assert_file_exists @source_file
      assert_not_file_exists @compiled_file
      Dassets.digest_source_files

      assert_file_exists @compiled_file
      assert_equal @exp_compiled_content, File.read(@compiled_file)
    end

  end

  class DigestSassTests < Assert::Context
    desc "digesting a sass source file with the sass engine registered"
    setup do
      @source_file = File.join(Dassets.config.source_path, "from_sass.sass")
      File.open(@source_file, 'w'){ |f| f.write(@factory.sass) }
      @compiled_file = File.join(Dassets.config.root_path, "public/from_sass-7173fff1fe11e06f1339beceaf4a9857.css")
      @exp_compiled_content = @factory.sass_compiled

      FileUtils.rm_f @compiled_file
    end

    should "produce a css file with the source sass compiled to css" do
      assert_file_exists @source_file
      assert_not_file_exists @compiled_file
      Dassets.digest_source_files

      assert_file_exists @compiled_file
      assert_equal @exp_compiled_content, File.read(@compiled_file)
    end

  end

end
