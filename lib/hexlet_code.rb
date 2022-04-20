# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/output'

# Main module
module HexletCode
  include Output
  def self.form_for(entity, **options)
    address = options[:url] || '#'
    fields = HexletCode::FormBuilder.new(entity)
    yield fields
    html = Output.format(fields.output)
    Tag.build('form', action: address, method: 'post') { html }
  end
end
