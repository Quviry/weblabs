# frozen_string_literal: true

def min_max(digits, k_length)
  assert k_length <= digits.length
  [digits.min(k_length), digits.max(k_length)]
end
