# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "object-in-enumerable/version"

Gem::Specification.new do |s|
  s.name        = "object-in-enumerable"
  s.version     = ObjectInEnumerable::VERSION
  s.authors     = ["Patrick Byrne"]
  s.email       = ["code@patrickbyrne.net"]
  s.homepage    = "https://github.com/pbyrne/object-in-enumerable/"
  s.summary     = %q{Provides Object#in?(enumerable) as a compliment to Enumerable#include?(object) provided by Ruby.}
  s.description = %q{Gives the more-readable `foo.in?(some_list)` rather than having to revert to the more backward `some_list.include?(foo)`.}
  s.platform = Gem::Platform::RUBY

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown"]
end
