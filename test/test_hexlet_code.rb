# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_form_for_creates_forms_code_without_url
    instance = 'some_instance'
    code = HexletCode.form_for instance do |_f|
      instance
    end
    assert_equal code, '<form action="#" method="post"></form>'
  end

  def test_that_form_for_creates_forms_code_with_url
    user = 'some_user'
    code = HexletCode.form_for user, url: '/users' do |_f|
      user
    end
    assert_equal code, '<form action="/users" method="post"></form>'
  end
end
