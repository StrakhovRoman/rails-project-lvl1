# frozen_string_literal: true

require_relative 'input_types/string_input'
require_relative 'input_types/text_input'
require 'active_support/inflector'

module HexletCode
  # Input class
  class Input
    def initialize(name, value, options)
      @name = name
      @value = value
      @options = options
    end

    def select
      @options[:as] ||= 'string'
      input_type = "#{@options[:as]}Input".camelize
      input_class = "HexletCode::#{input_type}".constantize
      input_class.new(@name, @options).build(@value)
    end
  end
end
