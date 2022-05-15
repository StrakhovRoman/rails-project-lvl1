# frozen_string_literal: true

require_relative './tag'

module HexletCode
  class Submit
    def initialize(name, **options)
      @attributes = { **options }
      @attributes[:name] = 'commit'
      @attributes[:type] = 'submit'
      @attributes[:value] = name
    end

    def build
      Tag.build('input', **@attributes)
    end
  end
end
