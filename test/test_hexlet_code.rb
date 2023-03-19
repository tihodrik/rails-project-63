# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  attr_accessor :user

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_form_for_creates_empty_form_without_url
    fixture = File.read('test/fixtures/empty_form_without_url.html')
    instance = 'some_instance'
    code = HexletCode.form_for instance do |_f|
      instance
    end
    assert_equal code, fixture
  end

  def test_that_form_for_creates_epmty_form_with_url
    fixture = File.read('test/fixtures/empty_form_with_url.html')
    user = 'some_user'
    code = HexletCode.form_for user, url: '/users' do |_f|
      user
    end
    assert_equal code, fixture
  end

  def test_that_form_for_creates_input_inside_form
    fixture = File.read('test/fixtures/form_for_user_only_input.html')

    code = HexletCode.form_for user do |f|
      f.input :name
    end

    assert_equal code, fixture
  end

  def test_that_form_for_creates_textarea_inside_form
    fixture = File.read('test/fixtures/form_for_user_textarea.html')

    code = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal code, fixture
  end

  def test_that_form_for_creates_textarea_inside_form_with_redefined_attributes
    fixture = File.read('test/fixtures/form_for_user_textarea_with_redefined_params.html')

    code = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, cols: 50, rows: 50
    end

    assert_equal code, fixture
  end

  def test_that_form_for_creates_input_inside_form_with_custom_params
    fixture = File.read('test/fixtures/form_for_user_with_custom_params.html')

    code = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal code, fixture
  end

  def test_that_form_for_raises_error_if_undefined_param_used
    assert_raises(NoMethodError) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_that_form_for_creates_standard_submit_button
    fixture = File.read('test/fixtures/form_for_with_standard_submit_button.html')

    code = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal code, fixture
  end

  def test_that_form_for_creates_custom_submit_button
    fixture = File.read('test/fixtures/form_for_with_custom_submit_button.html')

    code = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal code, fixture
  end
end
