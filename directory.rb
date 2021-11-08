# all students in one array
students = [ 
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Micheal Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# print all the students
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# we print the total number of students
print "Overall, we have #{students.count} great students"