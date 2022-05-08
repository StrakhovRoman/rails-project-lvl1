# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  module InputType
    class Label
      def initialize(name, **options)
        @attributes = { **options }
        @attributes[:for] = name
        @value = name.capitalize
      end

      def build
        Tag.build('label', **@attributes) { @value }
      end
    end
  end
end
