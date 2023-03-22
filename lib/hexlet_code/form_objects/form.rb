# frozen_string_literal: true

module HexletCode
  class Form < FormObject
    require_relative '../wrappers/html_wrapper'

    autoload(:Input, 'hexlet_code/form_objects/input.rb')
    autoload(:Textarea, 'hexlet_code/form_objects/textarea.rb')
    autoload(:Label, 'hexlet_code/form_objects/label.rb')
    autoload(:Submit, 'hexlet_code/form_objects/submit.rb')

    DEFAULT_OPTIONS = { action: '#', method: 'post' }.freeze

    attr_accessor :body
    attr_reader :instance, :wrapper

    def initialize(instance, **params)
      @body = []
      @instance = instance
      @wrapper =  if params[:wrapper].nil?
                    HtmlWrapper.new
                  else
                    Object.const_get("HexletCode::#{params[:wrapper].capitalize}Wrapper").send('new')
                  end
      @options = params.except(:wrapper)
      extend_options_with_defaults(DEFAULT_OPTIONS)

      super()
    end

    def render
      wrapper.render self
    end

    def input(attribute_name, options = {})
      label = Label.new(attribute_name)
      body << label

      input = find_input(attribute_name, options)
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
      case params[:as]
      when :text
        Textarea.new(attribute_name, instance.public_send(attribute_name), params.except(:as))
      else
        Input.new(attribute_name, instance.public_send(attribute_name), params.except(:as))
      end
    end
  end
end
