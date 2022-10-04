# frozen_string_literal: true

# On k over then digits size returns all values
def min_max(digits, k_length)
  [digits.min(k_length), digits.max(k_length)]
end
