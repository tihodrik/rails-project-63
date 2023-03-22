# frozen_string_literal: true

module HexletCode
  class Textarea < FormObject
    DEFAULT_OPTIONS = { cols: 20, rows: 40 }.freeze

    attr_reader :name, :value

    def initialize(attribute_name, attribute_value, params = {})
      @name = attribute_name
      @value = attribute_value
      @options = params

      extend_options_with_defaults(DEFAULT_OPTIONS)
    end
  end
end
