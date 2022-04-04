# frozen_string_literal: true

module HexletCode
  # Tag class
  class Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag, **options)
      attributes = get_attr(options)
      return "<#{tag}#{attributes}>#{yield}</#{tag}>" if block_given?

      if SINGLE_TAGS.include?(tag)
        "<#{tag}#{attributes}>"
      else
        "<#{tag}#{attributes}></#{tag}>"
      end
    end

    def self.get_attr(options)
      attributes = []
      options.each { |key, value| attributes << " #{key}=\"#{value}\"" }
      attributes.join
    end
  end
end
