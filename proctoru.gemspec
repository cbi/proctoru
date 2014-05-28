# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "proctoru/version"

Gem::Specification.new do |s|
  s.name        = "proctoru"
  s.version     = Proctoru::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joe Wright"]
  s.email       = ["joew@bitsmail.com"]
  s.homepage    = ""
  s.summary     = %q{ProctorU Client}
  s.description = %q{A client library for the ProctorU API}

  s.rubyforge_project = "proctoru"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'httparty', '~> 0.13.1', '>= 0.13.1'
  s.add_development_dependency "pry"
  s.add_development_dependency "rspec"
  s.add_development_dependency "dotenv"
end
