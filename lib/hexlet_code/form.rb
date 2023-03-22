# frozen_string_literal: true

module HexletCode
  class Form
    require_relative 'wrappers/html_wrapper'

    autoload(:Input, 'hexlet_code/input.rb')
    autoload(:Textarea, 'hexlet_code/textarea.rb')
    autoload(:Label, 'hexlet_code/label.rb')
    autoload(:Submit, 'hexlet_code/submit.rb')

    DEFAULTS = { action: '#', method: 'post' }.freeze

    attr_accessor :instance, :wrapper, :options, :body

    def initialize(instance, **params)
      @instance = instance
      @wrapper =  if params[:wrapper].nil?
                    HtmlWrapper.new
                  else
                    Object.const_get("HexletCode::#{params[:wrapper].capitalize}Wrapper").send('new')
                  end
      @options = params.except(:wrapper)
      @body = []

      set_options
    end

    def set_options
      options[:action] = options.delete :url unless options[:url].nil?

      DEFAULTS.each do |key, value|
        options[key] ||= value
      end
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

    def find_input(attribute_name, options = {})
      case options[:as]
      when :text
        Textarea.new(attribute_name, instance.public_send(attribute_name), options.except(:as))
      else
        Input.new(attribute_name, instance.public_send(attribute_name), options.except(:as))
      end
    end

    def submit(text = nil)
      button = Submit.new(text)
      body << button
    end
  end
end
