# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "forem"
  s.summary = "Insert Forem summary."
  s.description = "Insert Forem description."
  s.files       = `git ls-files`.split("\n")
  s.version = "0.0.1"
  
  # s.add_dependency "rails", "3.1.0"
  
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.5"
  s.add_development_dependency "capybara"
end
