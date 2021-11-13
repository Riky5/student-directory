# empty array accessible by all methods
@students = [] 

def interactive_menu
  loop do
  # 1.print the menu and ask the user what to do
    print_menu
    selection = STDIN.gets.chomp
   # 3.do what the user has asked
   process(selection)
  end
end

def print_menu
  menu = ["1. Input the students", "2. Show the students", "3. Save the list to students.csv", "4. Load the list from students.csv", "9. Exit"] 
  menu.each { |option| puts option }
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# get first name
  name = STDIN.gets.chomp
# while the name is not empty repeat the code
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
#   get next name from user
    name = STDIN.gets.chomp
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

def show_students
  print_header
  print
  print_footer
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesnt' exist."
    exit
  end
end

try_load_students
interactive_menu