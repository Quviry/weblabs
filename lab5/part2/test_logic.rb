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

  def generate_group(name_length)
    (0..name_length).map { (('a'..'z').to_a + ('0'..'9').to_a) [rand(36)] }.join
  end

  def test_line
    data = ['a steel', 'a stole', 'b beel', 'c stoool']
    data = parse data
    assert data['b'] == 1
  end

  def test_randm_group
    groups = [].fill(0..10) { generate_group(8) }.uniq
    assert parse(groups.map { |g| "#{g} something" }.to_a).map { |r| r[1] == 1 }.all?
  end

  def test_randm_group_doupling
    groups = [].fill(0..10) { generate_group(8) }.uniq
    groups += groups
    assert parse(groups.map { |g| "#{g} something" }.to_a).map { |r| r[1] == 2 }.all?
  end
end
