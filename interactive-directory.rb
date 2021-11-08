def input_students
  puts "Please entere the names of the students"
  puts "To finish, just hit return twice"
#   create an empty array
  students = []
# get first name
  name = gets.chomp
# while the name is not empty repeat the code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
#   get next name from user
    name = gets.chomp
  end
# return array of students
  students
end

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)