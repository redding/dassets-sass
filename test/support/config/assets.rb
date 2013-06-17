require 'dassets'
require 'dassets-sass'

Dassets.config.source TEST_SUPPORT_ROOT.join("app/assets") do |s|
  s.engine 'scss', Dassets::Sass::Engine, :syntax => 'scss'
  s.engine 'sass', Dassets::Sass::Engine, :syntax => 'sass'
end
