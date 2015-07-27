require File.expand_path("../lib/active_workaround/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "active_workaround"
  gem.version = ActiveWorkaround::VERSION
  gem.date = Date.today.to_s

  gem.summary = ""
  gem.description = ""

  gem.authors  = ["Trevor Grayson"]
  gem.email    = ["trevor@trevorgrayson.com"]
  gem.homepage = ""

  gem.add_dependency('rake')
  gem.add_development_dependency('rspec', [">= 2.0.0"])

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
