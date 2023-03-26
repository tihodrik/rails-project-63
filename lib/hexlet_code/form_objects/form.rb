# frozen_string_literal: true

module HexletCode
  class Form < FormObject
    require_relative '../wrappers/html_wrapper'
    require_relative 'input'
    require_relative 'text_input'
    
    autoload(:Label, 'hexlet_code/form_objects/label.rb')
    autoload(:Submit, 'hexlet_code/form_objects/submit.rb')

    DEFAULT_OPTIONS = { action: '#', method: 'post' }.freeze

    attr_accessor :body
    attr_reader :instance

    def initialize(instance, **params)
      @body = []
      @instance = instance
      @options = params
      extend_options_with_defaults(DEFAULT_OPTIONS)

      super()
    end

    def input(attribute_name, params = {})
      label = Label.new(attribute_name)
      body << label

      input = find_input(attribute_name, params)
      body << input
    end

    def submit(text = nil)
      button = Submit.new(text)
      body << button
    end

    private

    def extend_options_with_defaults(default_options)
      options[:action] = options.delete :url unless options[:url].nil?
      super
    end

    def find_input(attribute_name, params = {})
      input_class = Object.const_get("HexletCode::#{params[:as].to_s.capitalize}Input")
      input_class.new(attribute_name, instance.public_send(attribute_name), params.except(:as))
    end
  end
end
