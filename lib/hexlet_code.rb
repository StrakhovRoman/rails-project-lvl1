# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/fields'

# Main module
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url: '#')
    fields = HexletCode::Fields.new(user)
    yield fields
    Tag.build('form', action: url, method: 'post') { fields.convert }
  end
end
