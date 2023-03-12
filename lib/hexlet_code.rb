# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')

  def self.form_for(_instance, url: '#')
    "<form action=\"#{url}\" method=\"post\"></form>"
  end
end
