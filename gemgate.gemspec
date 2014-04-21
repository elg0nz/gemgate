# -*- encoding: utf-8 -*-

require File.expand_path("../lib/gemgate/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Peterson", "Gonzalo Maldonado"]
  gem.email         = ["dpiddy@gmail.com"]
  gem.description   = %q{Host a private gem repository with RiakCS}
  gem.summary       = %q{Host a private gem repository with RiakCS}
  gem.homepage      = "https://github.com/elg0nz/gemgate"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "riakcs-gemgate"
  gem.require_paths = ["lib"]
  gem.version       = Gemgate::VERSION

  gem.add_dependency "sinatra", "~> 1.3.2"
  gem.add_dependency "fog", "~> 1.22.0"

  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "debugger"
end
