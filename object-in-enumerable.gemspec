SPEC = Gem::Specification.new do |s|
  s.name = "object-in-enumerable"
  s.version = "1.0.0"
  s.author = "Patrick Byrne"
  s.email = "code@patrickbyrne.net"
  s.homepage = "http://github.com/pbyrne/object-in-enumerable/"
  s.summary = "Gives the more-readable `foo.in?(some_list)` rather than having to revert to the more backward `some_list.include?(foo)`."
  s.platform = Gem::Platform::RUBY
  s.files = ["lib/object-in-enumerable.rb"]
  s.require_path = "lib"
  # todo figure out whether to use a different parameter than s.test_file since i'm using rspec (does it really assume Test::Unit?)
  s.test_file = "spec/object-in-enumerable_spec.rb"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
end
