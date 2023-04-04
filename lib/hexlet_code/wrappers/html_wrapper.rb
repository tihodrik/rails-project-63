# frozen_string_literal: true

module HexletCode
  class HtmlWrapper
    autoload(:Tag, File.join(File.dirname(__FILE__), '../tag.rb'))

    def render(form)
      body = form.body.empty? ? '' : "\n#{render_body(form.body)}\n"
      Tag.build(form.keyword, **form.options) { body }
    end

    def render_body(form_input)
      form_input.each_with_object([]) do |element, result|
        result << Tag.build(element.keyword, **element.options, &element.action)
      end.join("\n")
    end
  end
end
