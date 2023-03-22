# frozen_string_literal: true

module HexletCode
  class Submit < FormObject
    attr_reader :type, :value

    def initialize(attribute_value)
      @value = attribute_value || 'Save'
      @type = 'submit'
      super()
    end
  end
end
