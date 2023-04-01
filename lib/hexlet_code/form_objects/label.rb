# frozen_string_literal: true

module HexletCode
  module FormObjects
    class Label < FormObject
      def initialize(attribute_name)
        @keyword = 'label'
        @options = {
          for: attribute_name.to_s
        }
        @action = proc { attribute_name.to_s.capitalize }
        super()
      end
    end
  end
end
