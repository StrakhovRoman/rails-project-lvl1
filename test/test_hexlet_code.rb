# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @first_user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    @second_user = User.new job: 'hexlet'
  end

  # rubocop:disable Metrics/MethodLength

  def test_single_tag_build
    assert_equal(
      '<br>',
      HexletCode::Tag.build('br')
    )
    assert_equal(
      '<img src="path/to/image">',
      HexletCode::Tag.build('img', src: 'path/to/image')
    )
    assert_equal(
      '<input type="submit" value="Save">',
      HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    )
  end

  # rubocop:enable Metrics/MethodLength

  def test_pair_tag_build
    assert_equal(
      '<label>Email</label>',
      HexletCode::Tag.build('label') { 'Email' }
    )
    assert_equal(
      '<label for="email">Email</label>',
      HexletCode::Tag.build('label', for: 'email') { 'Email' }
    )
    assert_equal('<div></div>', HexletCode::Tag.build('div'))
  end

  def test_form_with_textarea
    form = HexletCode.form_for @first_user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal(read_file('form_textarea.html'), form)
  end

  def test_form_with_textarea_new_attrs
    form = HexletCode.form_for @first_user do |f|
      f.input :name
      f.input :job, as: :text, cols: 50, rows: 50
    end
    assert_equal(read_file('form_textarea_new_attrs.html'), form)
  end

  def test_form_with_url
    form = HexletCode.form_for @first_user, url: '/users' do |f|
      f.input :name
    end
    assert_equal(read_file('form_with_url.html'), form)
  end

  def test_form_with_default_name_submit
    form = HexletCode.form_for @second_user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal(read_file('form_submit_default.html'), form)
  end

  def test_form_with_new_name_submit
    form = HexletCode.form_for @second_user do |f|
      f.input :job
      f.submit 'Push'
    end
    assert_equal(read_file('form_submit_new.html'), form)
  end
end
