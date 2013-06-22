# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "crossbrowsertesting-gem"
  s.version     = '0.1'
  s.authors     = ["Darren Nix"]
  s.email       = ["low@darrennix.com"]
  s.homepage    = "http://darrennix.com"
  s.summary     = "Ruby helper for crossbrowsertesting.com API"
  s.description = "Ruby helper for crossbrowsertesting.com API"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_dependency("yajl-ruby", "1.1.0")

end
