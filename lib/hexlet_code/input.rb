# frozen_string_literal: true

module HexletCode
  class Input
    DEFAULTS = {}.freeze

    attr_accessor :name, :value, :type, :options

    def initialize(attribute_name, attribute_value, params = {})
      @name = attribute_name
      @value = attribute_value
      @type = 'text'
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
