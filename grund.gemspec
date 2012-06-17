require File.expand_path("../lib/grund", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'grund'
  s.version     = Grund::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "A SCSS foundation generator"
  s.description = "Grund ('foundation' in Swedish) generates a couple of SCSS files to start off a new project with."
  s.authors     = ["Johan Brook"]
  s.email       = 'johan@johanbrook.com'
  s.files       = Dir["lib/grund.rb", "lib/grund/generator.rb", "bin/*", "*.md"]
  s.require_paths = ["lib"]
  s.homepage    = 'http://johanbrook.com'
  s.license     = 'MIT'
  s.executables = ['grund']
end