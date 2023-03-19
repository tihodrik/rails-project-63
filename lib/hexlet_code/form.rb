# frozen_string_literal: true

class String
  def constantize
    Object.const_get(self)
  end
end

module HexletCode
  class Form
    require_relative 'wrappers/html_wrapper'

    autoload(:Input, 'hexlet_code/input.rb')
    autoload(:Textarea, 'hexlet_code/textarea.rb')
    autoload(:Label, 'hexlet_code/label.rb')
    autoload(:Submit, 'hexlet_code/submit.rb')

    DEFAULTS = { action: '#', method: 'post' }.freeze

    attr_accessor :instance, :wrapper, :options, :body

    def initialize(instance, **options)
      @instance = instance
      @wrapper =  if options[:wrapper].nil?
                    HtmlWrapper.new
                  else
                    "HexletCode::#{options[:wrapper].capitalize}Wrapper".constantize.send('new')
                  end
      @options = options.except(:wrapper)

      @body = []

      set_defaults
    end

    def set_defaults
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
