# frozen_string_literal: true

module HexletCode
  class HtmlWrapper
    autoload(:Tag, 'hexlet_code/tag.rb')

    def render(form)
      body = String.new
      form.body.each do |object|
        body << "\n" << send("render_#{object.class.name.downcase.split('::').last}", object)
      end
      body << "\n"
      render_form(form.options, body)
    end

    def render_form(options, body)
      Tag.build('form', **options) { body }
    end

    def render_label(object)
      Tag.build('label', for: object.name) { object.name.capitalize }
    end

    def render_input(object)
      Tag.build('input', name: object.name, type: object.type, value: object.value, **object.options)
    end

    def render_textinput(object)
      Tag.build('textarea', name: object.name, **object.options) { object.value }
    end

    def render_submit(object)
      Tag.build('input', type: object.type, value: object.value)
    end
  end
end
