# frozen_string_literal: true

module HexletCode
  class Label < FormObject
    attr_reader :name

    def initialize(attribute_name)
      @name = attribute_name.to_s
    end
  end
end
