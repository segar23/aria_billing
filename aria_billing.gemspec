# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aria_billing/version"

Gem::Specification.new do |s|
  s.name        = "aria_billing"
  s.version     = AriaBilling::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Juan Pemberty"]
  s.email       = ["juan@pemberthy.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{Ruby Wrap for the aria subscription and billing system}

  s.rubyforge_project = "aria_billing"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "httparty"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
