# frozen_string_literal: true

# Logic-aggregation module
module Integral
  def self.function(argument)
    argument * Math.sin(argument * argument)
  end

  # integrates function by iteration
  def self.by_iteration(epsilon)
    answer = (1 - Math.cos(1)) / 2
    calculated = 100_000
    iterations = 1
    while (answer - calculated).abs > epsilon
      calculated = iteration(iterations)
      iterations *= 2
    end
    [calculated, iterations / 2]
  end

  def self.iteration(iterations)
    calculated = 0
    # rubocop:disable Style/For
    for step in (0..iterations) do
      calculated += function(1.0 * step / iterations) / iterations
    end
    # rubocop:enable Style/For
    calculated
  end
end
