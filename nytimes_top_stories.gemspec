# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nytimes_top_stories/version"

Gem::Specification.new do |spec|
  spec.name          = "nytimes_top_stories"
  spec.version       = NytimesTopStories::VERSION
  spec.authors       = ["Luisa Scavo"]
  spec.email         = ["luisascavo@gmail.com"]

  spec.summary       = %q{A CLI gem that scrapes the NYT website for headlines and displays more information upon request}
  spec.homepage      = "https://github.com/weezwo/nytimes-top-stories"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = "nytimes-top-stories"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'require_all', '~> 1.3', '>= 1.3.3'
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
