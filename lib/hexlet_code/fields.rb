# frozen_string_literal: true

require_relative "tag"

module HexletCode
  # Fields class
  class Fields
    def initialize(user)
      @user = user
      @fields = []
    end

    def input(field, **options)
      output = []
      value = @user.public_send(field)

      if options[:as] == :text
        output << get_html("textarea", cols: 20, rows: 40, name: field, value: value)
      else
        label = Tag.build("label", for: field) { field.capitalize }
        output << "#{label}\n  #{get_html(name: field, type: "text", value: value, **options)}"
      end

      @fields << output.join
    end

    def submit(buttom_name = "Save")
      @fields << get_html(name: "commit", type: "submit", value: buttom_name)
    end

    def get_html(tag = "input", **attributes)
      value = attributes[:value]
      attributes = attributes.except(:value) if value.nil? || tag == "textarea"
      return Tag.build(tag, **attributes) if HexletCode::Tag::SINGLE_TAGS.include?(tag)

      Tag.build(tag, **attributes) { value }
    end

    def convert
      html = @fields.flat_map { |element| ["\n  ", element] }
      "#{html.join}\n"
    end
  end
end
