# frozen_string_literal: true

# logic-aggregation module
module Logic
  # Take all "group student" strings and return array
  def self.count_students(students)
    resp = Hash.new 0
    students.each { |st| resp[st.split[0]] += st.split(/ /, 2)[1].size.positive? ? 1 : 0 }
    resp
  end
end
