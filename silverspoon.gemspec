require File.expand_path("../lib/silver_spoon/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "silverspoon"
  gem.version = SilverSpoon::VERSION
  gem.date = Date.today.to_s

  gem.summary = "Add has_many methods for non ActiveRecord associations."
  gem.description = "This may go from ActiveRecord to Object or Object to ActiveRecord"

  gem.authors  = ["Trevor Grayson"]
  gem.email    = ["trevor@trevorgrayson.com"]
  gem.homepage = ""

  gem.add_dependency('rake')
  gem.add_development_dependency('rspec', [">= 2.0.0"])

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
