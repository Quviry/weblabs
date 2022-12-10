# frozen_string_literal: true

# logic-aggregation module
module Logic
  # Returns result of math function
  # can raise ZeroDivisionError
  def self.calculate_y(x_param, z_param, r_param)
    Math.sin(x_param + (Math::PI * z_param)) / Math.cos(x_param / r_param)
  end
end
