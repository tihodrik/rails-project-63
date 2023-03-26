# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:FormObject, 'hexlet_code/form_object.rb')
  autoload(:Form, 'hexlet_code/form_objects/form.rb')

  def self.form_for(instance, **params)
    form = Form.new(instance, **params.except(:wrapper))
    wrapper = if params[:wrapper].nil?
                HtmlWrapper.new
              else
                Object.const_get("HexletCode::#{params[:wrapper].capitalize}Wrapper").new
              end
    yield(form) if block_given?
    wrapper.render form
  end
end
