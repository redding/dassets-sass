# this file is automatically required when you run `assert`
# put any test helpers here

# add the root dir to the load path
$LOAD_PATH.unshift(File.expand_path("../..", __FILE__))

# require pry for debugging (`binding.pry`)
require "pry"

require "test/support/factory"

class Assert::Context
  setup{ @factory = Factory }
end

ENV["DASSETS_TEST_MODE"] = "yes"
