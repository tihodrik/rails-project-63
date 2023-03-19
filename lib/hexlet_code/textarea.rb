# frozen_string_literal: true

module HexletCode
  class Textarea
    DEFAULTS = { cols: 20, rows: 40 }.freeze

    attr_accessor :name, :value, :options

    def initialize(attribute_name, attribute_value, options = {})
      @name = attribute_name
      @value = attribute_value
      @options = options

      set_defaults
    end

    def set_defaults
      DEFAULTS.each do |key, value|
        options[key] ||= value
      end
    end
  end
end
