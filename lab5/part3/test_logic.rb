# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require_relative 'logic'

require 'minitest/autorun'

# Do the things
class LogicTest3 < Minitest::Test
  def test_lines
    assert_empty min_max([1, 2, 3, 4, 5, 6], 3)[0] - [1, 2, 3]
    assert_empty min_max([1, 2, 3, 4, 5, 6], 3)[1] - [6, 4, 5]
  end

  def test_random_less_k
    max_vals = 10**5
    max_val = 10**9
    data = []
    data_length = rand(max_vals)
    data_length.times { data.push rand(max_val) }
    k_val = rand(data_length)
    re_data = min_max data, k_val
    assert_equal re_data.length, 2
    data.sort!
    assert_equal data[0, k_val], re_data[0], []
    assert_equal data[data_length - k_val, data_length - 1] - re_data[1], []
  end
end
