# frozen_string_literal: true

require_relative 'input_types/input'
require_relative 'input_types/label'
require_relative 'input_types/submit'

module HexletCode
  module FormRender
    def self.render(data)
      fields = data.map { |item| Render.build(item) }.flatten
      Render.convert_to_html(fields)
    end

    class Render
      attr_reader :output

      def initialize(data)
        @name = data[:name]
        @value = data[:value]
        @type = data[:type]
        @options = { **data.except(:name, :value) }
        @output = []
      end

      def select_input_types
        if @type == :submit
          @output << InputType::Submit.new(@name).build
        else
          label = InputType::Label.new(@name)
          @output << label.build
          input = InputType::Input.new(@name, @value, @options)
          @output << input.select_input_type
        end
      end

      def self.build(data)
        field = new data
        field.select_input_types
        field.output
      end

      def self.convert_to_html(data)
        html = data.flat_map { |item| ["\n  ", item] }
        "#{html.join}\n"
      end
    end
  end
end
