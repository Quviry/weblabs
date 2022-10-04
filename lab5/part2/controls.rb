# frozen_string_literal: true

require_relative 'logic'

data = []

1.step do
  puts 'Enter the note string or void string'
  line = gets
  break if line.split.length < 2

  data.push line
end

parse(data).each do |v|
  puts "Group: #{v[0]}, number of students: #{v[1]}"
end
