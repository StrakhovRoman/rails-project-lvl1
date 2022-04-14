# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # Simple input
  class SimpleInput
    def initialize(name, options)
      @attributes = { name: name, **options.except(:as) }
      @attributes[:type] = 'text'
    end

    def build(value)
      @attributes[:value] = value unless value.nil?
      HexletCode::Tag.build('input', **@attributes)
    end
  end
end
