# frozen_string_literal: true

# Returns result of math function
# can raise ZeroDivisionError
def y(x_param, z_param, r_param)
  Math.sin(x_param + Math::PI * z_param) / Math.cos(x_param / r_param)
end
