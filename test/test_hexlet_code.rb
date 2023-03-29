# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  attr_accessor :user

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_creates_empty_form_without_url
    instance = 'some_instance'
    code = HexletCode.form_for instance do |_f|
      instance
    end
    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_creates_epmty_form_with_url
    user = 'some_user'
    code = HexletCode.form_for user, url: '/users' do |_f|
      user
    end
    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_creates_input_inside_form
    code = HexletCode.form_for user do |f|
      f.input :name
    end

    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_creates_textarea_inside_form
    code = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_creates_textarea_inside_form_with_redefined_attributes
    code = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, cols: 50, rows: 50
    end

    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_creates_input_inside_form_with_custom_params
    code = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_raises_error_if_undefined_param_used
    assert_raises(NoMethodError) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_it_creates_standard_submit_button
    code = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def test_it_creates_custom_submit_button
    code = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal code, File.read(fixture_path(fixture_name(name)))
  end

  def fixture_name(method_name)
    method_name.to_s.delete_prefix('test_')
  end

  def fixture_path(fixture_name)
    "test/fixtures/#{fixture_name}.html"
  end
end
