# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require_relative 'logic'

require 'minitest/autorun'

# Do the things
class LogicTest2 < Minitest::Test
  def test_lines
    data = ['a steel', 'a stole', 'b beel', 'c stoool']
    data = parse data
    assert data['a'] == 2
  end

  def test_line
    data = ['a steel', 'a stole', 'b beel', 'c stoool']
    data = parse data
    assert data['b'] == 1
  end
end
