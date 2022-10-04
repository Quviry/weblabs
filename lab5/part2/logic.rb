# frozen_string_literal: true

def parse(strings)
  result = Hash.new 0
  strings.each do |string|
    result[string.split[0]] = result[string.split[0]] + 1
  end
  result
end
