# frozen_string_literal: true

# Support module for calculations
module NewtonHelper
  def close?(value, start_value)
    (((start_value**2) - value) / value).abs < 0.001 || start_value.zero?
  end

  def get_newton_rufson_steps(value, start_value = 1.0)
    [start_value,
     *(close?(value, start_value) ? [] : get_newton_rufson_steps(value, (start_value + (value / start_value)) / 2))]
  end
end
