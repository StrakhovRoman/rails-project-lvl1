# frozen_string_literal: true

module Fixture
  User = Struct.new(:name, :job, :gender, keyword_init: true)
end
