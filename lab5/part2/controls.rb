# frozen_string_literal: true

require_relative 'logic'
# nclude Logic

puts 'Please, enter group student pairs : '

students_list = []

[0].cycle do
  t = gets
  break if t.split.empty?

  students_list += [t]
end

Logic.count_students(students_list).each { |e| puts "Group: #{e[0]} students number: #{e[1]}" }
