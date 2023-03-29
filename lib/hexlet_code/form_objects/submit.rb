# frozen_string_literal: true

module HexletCode
  class Submit < FormObject

    def initialize(attribute_value)
      @keyword = 'input'
      @options = {
        type: 'submit',
        value: attribute_value || 'Save'
      }
      @action = nil
      super()
    end
  end
end
