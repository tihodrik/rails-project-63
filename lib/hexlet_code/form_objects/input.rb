# frozen_string_literal: true

module HexletCode
  module FormObjects
    class Input < FormObject
      DEFAULT_OPTIONS = {}.freeze

      def initialize(attribute_name, attribute_value, params = {})
        @keyword = 'input'
        @options = {
          name: attribute_name,
          type: 'text',
          value: attribute_value
        }.merge(params)
        @action = nil

        extend_options_with_defaults(DEFAULT_OPTIONS)
        super()
      end
    end
  end
end
