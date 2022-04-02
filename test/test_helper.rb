# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simplecov"
SimpleCov.start

require "hexlet_code"
require_relative "fixtures/user"

require "minitest/autorun"

def read_file(file)
  File.read("#{__dir__}/fixtures/files/#{file}")
end
