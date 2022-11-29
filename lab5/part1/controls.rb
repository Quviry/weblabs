# frozen_string_literal: true

require_relative 'logic'
# nclude Logic

puts 'Please, enter x, z and r to calculate y (wrong-type will be enterpretted as null) : '

x_param = gets.to_f
z_param = gets.to_f
r_param = gets.to_f

puts "Answer :  #{Logic.y x_param, z_param, r_param}"
