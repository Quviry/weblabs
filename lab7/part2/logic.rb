# frozen_string_literal: true

# base  class
class Window
  attr_accessor :height, :width

  def initialize(height, width)
    @width = width
    @height = height
  end

  def surface
    p @width * @height
  end
end

# inherited class
class ProtectedWindow < Window
  attr_accessor :protected

  def initialize(height, width, protected)
    super(height, width)
    @protected = protected
  end

  def protected?
    p protected
  end
end
