# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :fields

    def initialize(entity)
      @entity = entity
      @fields = { input: [], submit: nil }
    end

    def input(field, **options)
      value = @entity.public_send(field)
      @fields[:input] << { name: field, value: value, **options }
    end

    def submit(name = 'Save')
      @fields[:submit] = { name: name }
    end
  end
end
