# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "textile_manual"
  s.version     = "0.0.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jason Garber"]
  s.email       = ["jg@jasongarber.com"]
  s.homepage    = "http://redcloth.org/"
  s.summary     = %q{Provides the textile reference manual to other sites}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency 'middleman-core', '~> 4.2', '>= 4.2.1'
  s.add_runtime_dependency 'slim', '~> 3.0', '>= 3.0.6'
  s.add_runtime_dependency('RedCloth', '~> 4.3.2')

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
