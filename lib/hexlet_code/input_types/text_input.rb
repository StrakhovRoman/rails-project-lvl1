# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  module InputType
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
        Tag.build('textarea', **@attributes) { value }
      end
    end
  end
end
