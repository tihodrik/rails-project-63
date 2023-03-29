# frozen_string_literal: true

module HexletCode
  class HtmlWrapper
    autoload(:Tag, 'hexlet_code/tag.rb')

    def render(form)
      body = if form.body.empty?
               ''
             else
               "\n#{render_body(form.body)}\n"
             end

      Tag.build(form.keyword, **form.options) { body }
    end

    def render_body(form_input)
      form_input.each_with_object([]) do |element, result|
        result << Tag.build(element.keyword, **element.options, &element.action)
      end.join("\n")
    end
  end
end
