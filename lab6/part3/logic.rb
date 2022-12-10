# frozen_string_literal: true

# Logic-aggregation module
module Scale
  def self.deff(arg)
    arg
  end

  # returns scale function
  def self.scale(size, func = method(:deff), &block)
    descr = 1000
    func = proc(&block) if block_given?
    size / (-descr..descr).map { |value| func.call(1.0 * value / descr) }.max
  end
end
