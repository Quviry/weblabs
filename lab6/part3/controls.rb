# frozen_string_literal: true

require_relative 'logic'

puts 'Enter B for ratio(M) calculation'
B = gets.to_i
puts "x · sin(x): #{Scale.scale(B) { |x| x * Math.sin(x) }}"
puts "tg(x): #{Scale.scale(B) { |x| Math.tan(x) }}"
puts "x · sin(x): #{Scale.scale(B, proc { |x| x * Math.sin(x) })}"
puts "tg(x): #{Scale.scale(B, proc { |x| Math.tan(x) })}"
