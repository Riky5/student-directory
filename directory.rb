@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# get first name
  name = gets.chomp
# while the name is not empty repeat the code
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
#   get next name from user
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def interactive_menu
  # 1.print the menu and ask the user what to do
  loop do
    print_menu
  # 2.read the input and save it into a variable
    selection = gets.chomp
   # 3.do what the user has asked
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      "I don't know what you meant, try again"
    end
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu