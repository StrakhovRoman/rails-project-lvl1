# frozen_string_literal: true

module HexletCode
  # Tag builder
  class Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag, **options)
      attributes = build_attributes_string(options)
      return "<#{tag}#{attributes}>#{yield}</#{tag}>" if block_given?

      if SINGLE_TAGS.include?(tag)
        "<#{tag}#{attributes}>"
      else
        "<#{tag}#{attributes}></#{tag}>"
      end
    end

    def self.build_attributes_string(options)
      attributes = options.map { |key, value| " #{key}=\"#{value}\"" }
      attributes.join
    end
  end
end
