# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_render'

# Main module
module HexletCode
  def self.form_for(entity, **options)
    address = options[:url] || '#'
    fields = FormBuilder.new(entity)
    yield fields
    html = FormRender.render(fields.output)
    Tag.build('form', action: address, method: 'post') { html }
  end
end
