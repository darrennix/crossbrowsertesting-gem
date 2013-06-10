# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "crossbrowsertesting-gem"
  s.version     = '0.1'
  s.authors     = ["Darren Nix"]
  s.email       = ["low@darrennix.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby}
  s.description = %q{Ruby library}

  #s.rubyforge_project = "cbt"

  s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_dependency("yajl-ruby", "1.1.0")

end
