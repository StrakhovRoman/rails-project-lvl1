# frozen_string_literal: true

module HexletCode
  # Form builder
  class FormBuilder
    attr_reader :output

    def initialize(entity)
      @entity = entity
      @output = []
    end

    def input(field, **options)
      value = @entity.public_send(field)
      @output << { name: field, value: value, **options }
    end

    def submit(name = 'Save')
      @output << { type: :submit, name: name }
    end
  end
end
