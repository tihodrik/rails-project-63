# frozen_string_literal: true

module HexletCode
  class Input < FormObject
    DEFAULT_OPTIONS = {}.freeze

    attr_reader :name, :value, :type

    def initialize(attribute_name, attribute_value, params = {})
      @name = attribute_name
      @value = attribute_value
      @type = 'text'
      @options = params

      extend_options_with_defaults(DEFAULT_OPTIONS)
    end
  end
end
