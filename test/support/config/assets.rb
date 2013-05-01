require 'dassets'
require 'dassets-sass'

Dassets.configure do |c|
  c.root_path File.expand_path("../..", __FILE__)
  c.engine 'scss', Dassets::Sass::Engine, :syntax => 'scss'
  c.engine 'sass', Dassets::Sass::Engine, :syntax => 'sass'
  c.cache = nil
  c.file_store 'public'

end
