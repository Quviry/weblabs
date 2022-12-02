# frozen_string_literal: true

require_relative 'logic'

Window.new(3, 2).surface

ProtectedWindow.new(3, 2, false).surface

ProtectedWindow.new(3, 2, true).protected?

a = ProtectedWindow.new(3, 2, true)
a.surface
a.height = 10
a.surface

b = [Window.new(3, 2), Window.new(3, 10)]

b.each(&:surface)
