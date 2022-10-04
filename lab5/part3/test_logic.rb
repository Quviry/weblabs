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

  def test_k_overflow
    assert_equal min_max([1, 2, 3, 4, 5, 6], 10)[0], [1, 2, 3, 4, 5, 6]
  end

  def generate_source(max_val, max_vals)
    [].fill(0..rand(max_vals)) { rand(max_val) }
  end

  def test_random_less_k
    data = generate_source(10**9, 10**5)
    k_val = rand(data.length)
    re_data = min_max data, k_val
    data.sort!
    assert_empty data[0, k_val] - re_data[0]
  end

  def test_random_more_k
    data = generate_source(10**9, 10**5)
    k_val = rand(data.length)
    re_data = min_max data, k_val
    data.sort!
    assert_empty data[data.length - k_val, data.length - 1] - re_data[1]
  end
end
