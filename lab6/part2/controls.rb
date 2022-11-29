# frozen_string_literal: true

require_relative 'logic'

puts  "1e-4 #{Integral.by_each(1e-4)}"
puts  "1e-5 #{Integral.by_each(1e-5)}"
