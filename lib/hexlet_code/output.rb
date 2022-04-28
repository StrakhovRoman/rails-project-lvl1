# frozen_string_literal: true

module HexletCode
  # Output module
  module Output
    def self.convert(fields)
      html = fields.flat_map { |item| ["\n  ", item] }
      "#{html.join}\n"
    end
  end
end
