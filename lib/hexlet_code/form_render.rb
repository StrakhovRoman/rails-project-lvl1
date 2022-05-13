# frozen_string_literal: true

require_relative 'input_types/input'
require_relative 'input_types/label'
require_relative 'input_types/submit'

module HexletCode
  module FormRender
    def self.render(data)
      input = data[:input]
      submit = data[:submit]

      fields = input.map { |item| Render.build(item) }.flatten
      fields << Render.new(submit).add_submit_field unless submit.nil?
      Render.convert_to_html(fields)
    end

    class Render
      attr_reader :output

      def initialize(data)
        @name = data[:name]
        @value = data[:value]
        @options = { **data.except(:name, :value) }
        @output = []
      end

      def add_input_field
        label = InputType::Label.new(@name)
        @output << label.build
        input = InputType::Input.new(@name, @value, @options)
        @output << input.select_input
      end

      def add_submit_field
        InputType::Submit.new(@name).build
      end

      def self.build(data)
        fields = new data
        fields.add_input_field
        fields.output
      end

      def self.convert_to_html(data)
        html = data.flat_map { |item| ["\n  ", item] }
        "#{html.join}\n"
      end
    end
  end
end
