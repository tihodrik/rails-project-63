# frozen_string_literal: true

module HexletCode
  class Input
    DEFAULTS = {}.freeze

    attr_accessor :name, :value, :type, :options

    def initialize(attribute_name, attribute_value, options = {})
      @name = attribute_name
      @value = attribute_value
      @type = 'text'
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
