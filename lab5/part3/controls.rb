# frozen_string_literal: true

require_relative 'logic'

puts 'Please, enter array, then input k : '

response = Logic.minmax(gets.split.map(&:to_i), gets.to_i)

p response[0]
p response[1]
