# frozen_string_literal: true

module HexletCode
  class Label
    attr_accessor :name

    def initialize(attribute_name)
      @name = attribute_name.to_s
    end
  end
end
