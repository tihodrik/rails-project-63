# frozen_string_literal: true

module HexletCode
  module Tag
    TAGS = {
      single: %w[img input br],
      paired: %w[label div textarea form]
    }.freeze

    def self.paired?(tag)
      TAGS[:paired].include? tag
    end

    def self.build(tag, **args)
      result = "<#{tag} #{stringifyed_params(args)}>"
      if paired? tag
        result << yield if block_given?
        result << "</#{tag}>"
      end
      result
    end

    def self.stringifyed_params(params)
      params.each_with_object([]) do |(key, value), result|
        result << "#{key}=\"#{value}\""
      end.join(' ')
    end
  end
end
