# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  # Text input
  class TextInput
    COLS = '20'
    ROWS = '40'
    def initialize(name, options)
      @attributes = { name: name, **options.except(:as) }
      @attributes[:cols] ||= COLS
      @attributes[:rows] ||= ROWS
    end

    def build(value)
      HexletCode::Tag.build('textarea', **@attributes) { value }
    end
  end
end
