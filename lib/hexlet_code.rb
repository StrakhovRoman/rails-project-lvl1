# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_render'

module HexletCode
  def self.form_for(entity, **options)
    url = options[:url] || '#'
    form_builder = FormBuilder.new(entity)
    yield form_builder
    html = FormRender.render(form_builder.fields)
    Tag.build('form', action: url, method: 'post') { html }
  end
end
