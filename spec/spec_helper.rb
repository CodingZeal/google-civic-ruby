require 'rubygems'
require 'rspec'
require 'rspec/autorun'
require 'pry'
require 'webmock/rspec'
require "multi_json"

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')
Dir[File.join(PROJECT_ROOT, 'spec/support/**/*.rb')].each { |file| require(file) }

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include Fixtures
  config.include Requests
end

require 'google-civic'
