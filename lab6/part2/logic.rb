# frozen_string_literal: true

# Logic-aggregation module
module Integral
  def self.function(argument)
    argument * Math.sin(argument * argument)
  end

  # integrates function by iteration
  def self.by_each(epsilon)
    answer = (1 - Math.cos(1)) / 2
    calculated = 100_000
    iterations = 1
    while (answer - calculated).abs > epsilon
      calculated = 0
      iterations.times { |time| calculated += function(1.0 * time / iterations) / iterations }
      iterations *= 2
    end
    iterations / 2
  end
end
