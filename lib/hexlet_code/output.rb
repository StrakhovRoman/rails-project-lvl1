# frozen_string_literal: true

module HexletCode
  # Output module
  module Output
    def self.format(fields)
      html = fields.flat_map { |element| ["\n  ", element] }
      "#{html.join}\n"
    end
  end
end
