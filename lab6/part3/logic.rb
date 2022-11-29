# frozen_string_literal: true

# Logic-aggregation module
module Scale
  def self.deff(arg)
    arg
  end

  # returns scale function
  def self.scale(size, func = @deff)
    descr = 1000
    return size / (-descr..descr).map { |t| yield(1.0 * t / descr) }.max if block_given?

    size / (-descr..descr).map { |t| func.call(1.0 * t / descr) }.max
  end
end
