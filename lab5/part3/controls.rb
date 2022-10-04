# frozen_string_literal: true

require_relative 'logic'

puts 'Enter numbers in line'
numbers = gets.split.map { |n| Integer(n) }
puts 'Enter k (numer of min&max digits)'
k = Integer(gets)

puts min_max(numbers, k)
