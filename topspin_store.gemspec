# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "topspin_store/version"

Gem::Specification.new do |s|
  s.name        = "topspin_store"
  s.version     = TopspinStore::VERSION
  s.authors     = ["Bill Horsman"]
  s.email       = ["bill@logicalcobwebs.com"]
  s.homepage    = "https://github.com/bandzoogle/topspin_store"
  s.summary     = %q{TODO: Client for the TopSpin Store API V2}
  s.description = %q{TODO: Client for the TopSpin Store API V2}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "httparty"
end
