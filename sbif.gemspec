# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sbif/version"

Gem::Specification.new do |s|
  s.name        = "sbif"
  s.version     = Sbif::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ignacio Mella"]
  s.email       = ["ignacio@acid.cl"]
  s.homepage    = %q{https://github.com/imella/sbif-ruby}
  s.summary     = %q{Ruby wrapper for the SBIF API}
  s.description = %q{Ruby wrapper for the SBIF API}

  s.rubyforge_project = "sbif"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "rest-client"
end
