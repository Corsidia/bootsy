# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'bootsy/version'

Gem::Specification.new do |s|
  s.name        = 'bootsy'
  s.version     = Bootsy::VERSION
  s.authors     = ['Duccio Armenise', 'Volmer Campos Soares']
  s.email       = ['duccio@corsidia.com']
  s.homepage    = 'http://github.com/Corsidia/bootsy'
  s.summary     = 'A beautiful WYSIWYG editor with image uploads for Rails.'
  s.description = 'A beautiful WYSIWYG editor with image uploads for Rails.'
  s.license     = 'MIT'

  s.files =
    Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'paperclip', '~> 5.0.0'
end
