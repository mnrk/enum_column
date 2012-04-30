# -*- encoding: utf-8 -*-
require File.expand_path('../lib/enum_column/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jan Minarik"]
  gem.email         = ["jan@minarik.net"]
  gem.description   = %q{Enumaration column for an ActiveRecord model}
  gem.summary       = %q{Allows to store enumeration as an integer code}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "enum_column"
  gem.require_paths = ["lib"]
  gem.version       = EnumColumn::VERSION
end
