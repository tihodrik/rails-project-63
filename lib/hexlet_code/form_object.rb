# frozen_string_literal: true

module HexletCode
  class FormObject
    attr_accessor :options
    attr_reader :keyword, :action

    private

    def extend_options_with_defaults(default_options)
      default_options.each do |key, value|
        options[key] ||= value
      end
    end
  end
end
