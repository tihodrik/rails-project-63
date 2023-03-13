# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Form, 'hexlet_code/form.rb')

  def self.form_for(instance, **params)
    f = Form.new(instance, **params)
    yield(f) if block_given?
    f.generate
  end
end
