# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  module InputType
    class StringInput
      def initialize(name, options)
        @attributes = { name: name, **options.except(:as) }
        @attributes[:type] = 'text'
      end

      def build(value)
        @attributes[:value] = value unless value.nil?
        Tag.build('input', **@attributes)
      end
    end
  end
end
