# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # Text input
  class TextInput
    def initialize(name, options)
      @attributes = { name: name, **options.except(:as) }
      @attributes[:cols] ||= '20'
      @attributes[:rows] ||= '40'
    end

    def build(value)
      HexletCode::Tag.build('textarea', **@attributes) { value }
    end
  end
end
