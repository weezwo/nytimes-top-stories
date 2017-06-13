# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "./lib/version"

Gem::Specification.new do |spec|
  spec.name          = "nytimes-top-stories"
  spec.version       = NytimesTopStories::VERSION
  spec.authors       = ["Luisa Scavo"]
  spec.email         = ["luisascavo@gmail.com"]

  spec.summary       = %q{Pulls headlines from the NYT website and offers more information on request}
  spec.homepage      = "https://github.com/weezwo/nytimes-top-stories"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["nytimes-top-stories"]
  spec.require_paths = ["lib" "lib/nytimes_top_stories"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
  spec.add_dependency'open_uri_redirections'
end
