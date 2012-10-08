# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mecab-syllable/version'

Gem::Specification.new do |gem|
  gem.name          = "mecab-syllable"
  gem.version       = MeCab::Syllable::VERSION
  gem.authors       = ["Masafumi Yokoyama"]
  gem.email         = ["myokoym@gmail.com"]
  gem.description   = %q{Function addition for mecab-ruby. Supporting syllable parse.}
  gem.summary       = %q{Syllable parser for mecab-ruby}
  gem.homepage      = "https://github.com/myokoym/mecab-syllable"

  gem.post_install_message = '### WARNING: This gem is RENAME to mecab-mora. ###'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>= 1.9.1'

  gem.add_runtime_dependency 'mecab-modern', ['>= 0.0.2']

  gem.add_development_dependency 'rake',  ['~> 0.9.2']
  gem.add_development_dependency 'rspec', ['~> 2.11.0']
end
