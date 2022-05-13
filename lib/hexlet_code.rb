# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_render'

module HexletCode
  def self.form_for(entity, **options)
    url = options[:url] || '#'
    fields = FormBuilder.new(entity)
    yield fields
    html = FormRender.render(fields.fields)
    Tag.build('form', action: url, method: 'post') { html }
  end
end
