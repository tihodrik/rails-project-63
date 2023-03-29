# frozen_string_literal: true

module HexletCode
  class TextInput < FormObject
    DEFAULT_OPTIONS = { cols: 20, rows: 40 }.freeze

    def initialize(attribute_name, attribute_value, params = {})
      @keyword = 'textarea'
      @options = {
        name: attribute_name
      }.merge(params)
      @action = proc { attribute_value }

      extend_options_with_defaults(DEFAULT_OPTIONS)
      super()
    end
  end
end
