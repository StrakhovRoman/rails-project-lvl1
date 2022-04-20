# frozen_string_literal: true

require_relative 'tag'
require_relative 'input'

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
      @output << Tag.build('label', for: field) { field.capitalize }
      input = HexletCode::Input.new(field, value, options)
      @output << input.select
    end

    def submit(value = 'Save')
      @output << Tag.build(
        'input',
        name: 'commit',
        type: 'submit',
        value: value
      )
    end
  end
end
