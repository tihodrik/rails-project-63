# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Form, 'hexlet_code/form.rb')

  def self.form_for(instance, url: '#')
    f = Form.new(instance, url)
    yield(f)
    f.generate
  end
end
