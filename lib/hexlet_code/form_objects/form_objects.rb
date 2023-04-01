# frozen_string_literal: true

module HexletCode
  module FormObjects
    autoload(:Input, File.join(File.dirname(__FILE__), '/input.rb'))
    autoload(:TextInput, File.join(File.dirname(__FILE__), '/text_input.rb'))
    autoload(:Label, File.join(File.dirname(__FILE__), '/label.rb'))
    autoload(:Submit, File.join(File.dirname(__FILE__), '/submit.rb'))
  end
end
