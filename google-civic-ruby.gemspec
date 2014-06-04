# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google-civic/version'

Gem::Specification.new do |spec|
  spec.name          = "google-civic"
  spec.version       = Google::Civic::VERSION
  spec.authors       = ["Coding ZEAL", "Adam Cuppy"]
  spec.email         = ["adam@codingzeal.com"]
  spec.summary       = %q{Ruby wrapper for the Google Civic API}
  spec.homepage      = "https://github.com/CodingZeal/google-civic-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "multi_json", "~> 1.10"
  spec.add_dependency "hashie", "~> 3.0"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.9"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock", "~> 1.18"
end
