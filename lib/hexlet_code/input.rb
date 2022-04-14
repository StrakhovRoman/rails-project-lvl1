# frozen_string_literal: true

require_relative 'input_types/simple'
require_relative 'input_types/textarea'

module HexletCode
  # Input class
  class Input
    def initialize(name, value, options)
      @name = name
      @value = value
      @options = options
    end

    def select
      input = case @options[:as]
              when :text
                TextInput.new(@name, @options)
              else
                SimpleInput.new(@name, @options)
              end
      input.build(@value)
    end
  end
end
