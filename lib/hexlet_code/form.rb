# frozen_string_literal: true

module HexletCode
  class Form < FormObject
    DEFAULT_OPTIONS = { action: '#', method: 'post' }.freeze

    attr_accessor :body
    attr_reader :instance

    def initialize(instance, **params)
      @body = []
      @instance = instance

      @keyword = 'form'

      @options = params.except(:url)
      @options[:action] = params[:url] unless params[:url].nil?

      extend_options_with_defaults(DEFAULT_OPTIONS)
      super()
    end

    def input(attribute_name, params = {})
      label = HexletCode::FormObjects::Label.new(attribute_name)
      body << label

      input = find_input(attribute_name, params)
      body << input
    end

    def submit(text = nil)
      button = HexletCode::FormObjects::Submit.new(text)
      body << button
    end

    private

    def find_input(attribute_name, params = {})
      input_class = Object.const_get("HexletCode::FormObjects::#{params[:as].to_s.capitalize}Input", true)
      input_class.new(attribute_name, instance.public_send(attribute_name), params.except(:as))
    end
  end
end
