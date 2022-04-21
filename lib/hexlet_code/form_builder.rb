# frozen_string_literal: true

require_relative 'tag'
require_relative 'input'
require_relative 'input_types/label'
require_relative 'input_types/submit'

module HexletCode
  # Form builder class
  class FormBuilder
    attr_accessor :output

    def initialize(entity)
      @entity = entity
      @output = []
    end

    def input(field, **options)
      value = @entity.public_send(field)
      label = Label.new(field)
      @output << label.build
      input = Input.new(field, value, options)
      @output << input.select
    end

    def submit(name = 'Save')
      submit = Submit.new(name)
      @output << submit.build
    end
  end
end
