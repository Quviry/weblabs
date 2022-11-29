# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require_relative 'logic'

require 'minitest/autorun'

# Do the things
class LogicTest < Minitest::Test
  include Logic
  def test_zero
    assert Logic.y(0, 0, 1).zero?
  end

  def test_one
    assert Logic.y(0, 0.5, 1) == 1
  end

  def test_fall
    assert_raises(ZeroDivisionError) { Logic.y(0, 0, 0) }
  end
end
