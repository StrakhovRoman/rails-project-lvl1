# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  def test_single_tag_build
    assert_equal(
      '<img src="path/to/image">',
      HexletCode::Tag.build('img', src: 'path/to/image')
    )
    assert_equal(
      '<input type="submit" value="Save">',
      HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    )
  end

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
end
