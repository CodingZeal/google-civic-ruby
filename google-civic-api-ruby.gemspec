# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google-civic-api/version'

Gem::Specification.new do |spec|
  spec.name          = "google-civic-api"
  spec.version       = Google::Civic::Api::VERSION
  spec.authors       = ["Coding ZEAL", "Adam Cuppy"]
  spec.email         = ["adam@codingzeal.com"]
  spec.summary   = %q{Google Civic API wrapper}
  spec.homepage      = "https://github.com/CodingZeal/google-civic-api-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "google-api-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
