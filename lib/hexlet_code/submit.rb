# frozen_string_literal: true

module HexletCode
  class Submit
    attr_accessor :type, :value

    def initialize(attribute_value)
      @value = attribute_value || 'Save'
      @type = 'submit'
    end
  end
end
