# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # Fields class
  class Fields
    def initialize(user)
      @user = user
      @fields = []
    end

    def input(field, **options)
      value = @user.public_send(field)
      label = Tag.build('label', for: field) { field.capitalize }

      html = if options[:as] == :text
               options = options.except(:as)
               get_html('textarea', cols: 20, rows: 40, name: field, value: value, **options)
             else
               get_html('input', name: field, type: 'text', value: value, **options)
             end
      @fields << "#{label}\n  #{html}"
    end

    def submit(buttom_name = 'Save')
      @fields << get_html('input', name: 'commit', type: 'submit', value: buttom_name)
    end

    def get_html(tag, **attributes)
      value = attributes[:value]
      attributes = attributes.except(:value) if value.nil? || tag == 'textarea'
      return Tag.build(tag, **attributes) if HexletCode::Tag::SINGLE_TAGS.include?(tag)

      Tag.build(tag, **attributes) { value }
    end

    def convert
      html = @fields.flat_map { |element| ["\n  ", element] }
      "#{html.join}\n"
    end
  end
end
