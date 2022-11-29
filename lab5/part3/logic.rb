# frozen_string_literal: true

# Logic-aggregation module
module Logic
  # return k min and k max numbers, if k > numbers.size return all
  def self.minmax(numbers, limit)
    [numbers.min(limit), numbers.max(limit)]
  end
end
