# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:HtmlWrapper, File.join(File.dirname(__FILE__), '/hexlet_code/wrappers/html_wrapper'))
  autoload(:FormObject, File.join(File.dirname(__FILE__), '/hexlet_code/form_object.rb'))
  autoload(:Form, File.join(File.dirname(__FILE__), '/hexlet_code/form.rb'))
  autoload(:FormObjects, File.join(File.dirname(__FILE__), '/hexlet_code/form_objects/form_objects.rb'))

  def self.form_for(instance, **params)
    form = Form.new(instance, **params.except(:wrapper))
    yield(form) if block_given?

    wrapper = HtmlWrapper.new
    wrapper.render form
  end
end
