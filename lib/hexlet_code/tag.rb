# frozen_string_literal: true

module HexletCode
  module Tag
    TAGS = {
      single: %w[img input br],
      paired: %w[label div]
    }.freeze

    def self.paired?(tag)
      TAGS[:paired].include? tag
    end

    def self.build(tag, **args)
      result = ["<#{tag}"]
      args.each do |key, value|
        result << "#{key}=\"#{value}\""
      end
      result = result.join(' ') << '>'
      if paired? tag
        result << yield if block_given?
        result << "</#{tag}>"
      end
      result
    end
  end
end
