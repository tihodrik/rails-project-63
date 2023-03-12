# frozen_string_literal: true

module HexletCode
  class Form
    autoload(:Tag, 'hexlet_code/tag.rb')

    attr_reader :instance, :url
    attr_accessor :body

    def initialize(instance, url)
      @instance = instance
      @url = url
      @body = String.new
    end

    def generate
      "<form action=\"#{url}\" method=\"post\">#{body}\n</form>"
    end

    def input(field, as: nil, **params)
      options = {
        name: field.to_s
      }

      case as
      when nil
        tag = 'input'
        options[:type] = 'text'
        options[:value] = instance.public_send(field)
        body << "\n" << Tag.build(tag, **options.merge!(params))
      when :text
        tag = 'textarea'
        options[:cols] = params[:cols] || 20
        options[:rows] = params[:cols] || 40
        body << "\n" << Tag.build(tag, **options.merge(params)) { instance.public_send(field) }
      end
    end
  end

end
