# frozen_string_literal: true

module HexletCode
  class Textarea
    DEFAULTS = { cols: 20, rows: 40 }.freeze

    attr_accessor :name, :value, :options

    def initialize(attribute_name, attribute_value, params = {})
      @name = attribute_name
      @value = attribute_value
      @options = params

      set_options
    end

    def set_options
      DEFAULTS.each do |key, value|
        options[key] ||= value
      end
    end
  end
end
