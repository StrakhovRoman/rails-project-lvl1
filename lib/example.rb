# frozen_string_literal: true

# HexletCode::Tag.build('br')
# # <br>

# HexletCode::Tag.build('img', src: 'path/to/image')
# # <img src="path/to/image">

# HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# # <input type="submit" value="Save">

# # Для парных тегов тело передается как блок
# HexletCode::Tag.build('label') { 'Email' }
# # <label>Email</label>

# HexletCode::Tag.build('label', for: 'email') { 'Email' }
# # <label for="email">Email</label>

# HexletCode::Tag.build('div')
# # <div></div>

# def build(arg, **kwargs)
#   puts arg.inspect
#   puts kwargs.inspect
# end

# TEMPLATE = "<#{tag} #{attributes}>" % { tag: tag, attributes: attributes }
# SINGLE_TAGS.include?(tag)

SINGLE_TAGS = %w[br img input].freeze

def build(tag, **options)
  attributes = get_attr(options)
  return "<#{tag}#{attributes}>#{yield}</#{tag}>" if block_given?

  SINGLE_TAGS.include?(tag) ? "<#{tag}#{attributes}>" : "<#{tag}#{attributes}></#{tag}>"
end

def get_attr(options)
  attributes = []
  options.each { |key, value| attributes << " #{key}=\"#{value}\"" }
  attributes.join
end

puts build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">
puts build('img', src: 'path/to/image')
# <img src="path/to/image">
puts build('br')
puts build('label', for: 'email') { 'Email' }
# <label for="email">Email</label>