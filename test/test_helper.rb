begin
  addpath = lambda do |p|
    path = File.expand_path("../../#{p}", __FILE__)
    $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
  end
  addpath.call("lib")
  addpath.call("vendor/lib")
end

require 'rubygems'
require 'bundler/setup'
require 'shopify_cli'
require 'byebug'

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'minitest_ext'
require_relative 'test_helpers'
require 'fakefs/safe'

require 'mocha/minitest'

Minitest::Reporters.use!([Minitest::Reporters::SpecReporter.new])

module Minitest
  class Test
    RUBY_VERSION = File.read('.ruby-version').tr("\n", '')
  end

  module Assertions
    def assert_nothing_raised(*)
      yield
    end
  end
end