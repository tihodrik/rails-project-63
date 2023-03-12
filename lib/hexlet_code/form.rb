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
      body << "\n"

      case as
      when nil
        body << Tag.build('input', **get_input_options(field, params))
      when :text
        body << Tag.build('textarea', **get_textarea_options(field, params)) { instance.public_send(field) }
      end
    end

    private

    def get_input_options(field, params)
      {
        name: field.to_s,
        type: 'text',
        value: instance.public_send(field)
      }.merge(params)
    end

    def get_textarea_options(field, params)
      {
        name: field.to_s,
        cols: params[:cols] || 20,
        rows: params[:cols] || 40
      }.merge(params)
    end
  end
end
