# Raymond Gan - Ruby Assessment

#1. Arrays
puts "--------------------Question 1--------------------------"
array = ["Blake", "Ashley", "Jeff"]
array << "Raymond"
p array
puts array[1]               # prints "Ashley"
puts array.index('Jeff')    # prints "2"
puts

#2. Hashes
puts "--------------------Question 2--------------------------"
instructor = {name: "Ashley", age: 27}  # Ruby 1.9 syntax for hashes
instructor[:location] = 'NYC'
puts instructor
puts instructor[:name]  # prints "Ashley"
p instructor.key(27)    # prints ":age"
puts

#3. Nested structures
puts "--------------------Question 3--------------------------"

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name => "Blake", :subject => "being awesome" },
    {:name => "Ashley", :subject => "being better than blake"},
    {:name => "Jeff", :subject => "karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name => "Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

# a. Add a key to the school hash called "founded_in" and set it to the value 2013.

school[:founded_in] = 2013

# b. Add a student to the school's students' array.

school[:students] << {name: "Natalie Dormer", grade: "A"}  # :students is array of hashes
 
# c. Remove "Billy" from the students' array. [2 ways]

school[:students].delete_at(1)                          # Delete "Billy" hash
school[:students].delete({name: "Sophie", grade: "C"})  # Delete "Sophie" hash
 
# d. Add a key to every student in the students array called "semester" and assign it the value "Summer".

school[:students].map {|s| s[:semester] = "Summer"} 

# school[:students].each {|s| s[:semester] = "Summer"}   --- another way

# e. Change Ashley's subject to "being almost better than Blake"

school[:instructors][1][:subject] = "being almost better than Blake"
 
# f. Change Frank's grade from "A" to "F".

school[:students][1][:grade] = "F"  # Index = 1, since Billy was deleted
 
# g. Return the name of the student with a "B".

school[:students].each do |s|
  puts "#{s[:name]} has a B grade" if s[:grade] == "B"     # prints "Marissa"
end
 
# h. Return the subject of the instructor "Jeff".

puts "#{school[:instructors][2][:subject]} is subject of instructor Jeff\n\n"  # prints "karaoke"

=begin   --- more general solution ---
school[:instructors].each do |instructor|
  puts instructor[:subject] if instructor[:name] == "Jeff"
end
=end
 
# i. Write a statement to print out all the values in the school. 

puts "Printing only top-level keys of school:\n\n"
puts school.values      # prints values of only top-level keys
puts

# prints values of everything, including nested hashes
puts "Printing values of EVERYTHING, included nested hashes:\n\n"
school.values.each do |v|
  if !v.is_a?(Array)        # if value is NOT an array of hashes, print it
    puts v
  else
    v.each do |nestedhash|  # loops through each hash in array of hashes
      p nestedhash.values
    end
  end
end
puts

#4. Methods: You will need to pass the school variable to each of these methods to include it in scope.

puts "--------------------Question 4--------------------------"
# a. i. Create a method to return the grade of a student, given that student's name. 

def grade(student, school)
  school[:students].each do |s|
    return s[:grade] if s[:name] == student
  end
end

while true
  puts "Enter student's name. I'll tell you grade. Hit 'Enter' to quit:"
  student = gets.chomp
  break if student == ''
  puts "#{student}'s grade is #{grade(student, school)}"
end

# ii. Then use it to refactor your work in 3.i.

def subject(instructor, school)
  school[:instructors].each do |i|
    return i[:subject] if i[:name] == instructor
  end
end

while true
  puts "Enter either student or instructor's name. I'll tell you either grade or subject. Hit 'Enter' to quit:"
  input = gets.chomp
  break if input == ''

  # if you enter instructor's name, grade() will not find it and instead will return array
  if !grade(input, school).is_a?(Array)     # if you enter student's name
    puts "#{input}'s grade is #{grade(input, school)}"
  else                                      # if you enter instructor's name
    puts "#{input}'s subject is #{subject(input, school)}"
  end
end
 
# b. i. Create a method to update an instructor's subject given the instructor and the new subject. 

def update(instructor, subject, school)
  school[:instructors].each do |i|
    i[:subject] = subject if i[:name] == instructor
  end
end
 
# ii. Then use it to update Blake's subject to "being terrible".

update('Blake', 'being terrible', school)
puts school[:instructors]
puts
 
# c. i. Create a method to add a new student to the schools student array. 

def addstudent(student, grade, semester, school)
  school[:students] << {name: student, grade: grade, semester: semester} 
end
 
# ii. Then use it to add yourself to the school students array.

addstudent('Raymond', 'A', 'Summer', school)
puts school[:students]
puts
 
# d. i. Create a method that adds a new key at the top level of the school hash, given a key and a value. 
 
def addkey(key, value, school)
  school[key] = value
end

# ii. Then use it to add a "Ranking" key with the value 1.

addkey(:Ranking, 1, school)
p school
puts

=begin
5. Object orientation

a. Create a bare bones class definition for a School class.
b. Define an initialize method for the School class

i. Give your School class the instance variables: name, location, ranking, students, instructors. 
These # variables should be of the same type as they are in the hash above.
ii. Rewrite your initialize method definition to take a parameter for each instance variable.
iii. Initialize each instance variable with the value of the corresponding parameter

c. Create an attr_accessor for name, location, instructors, and students. Create an attr_reader for ranking.
d. Create a method to set ranking, given a ranking value.
e. Create a method to add a student to the school, given a name, a grade, and a semester.
f. Create a method to remove a student from the school, given a name
g. Create an array constant SCHOOLS that stores all instances of your School class.
=end
puts "--------------------Question 5--------------------------"

SCHOOLS = []

class School
  attr_accessor :name, :location, :instructors, :students
  attr_reader :ranking

  def initialize(name, location, ranking, students = [], instructors = [])
    @name = name
    @location = location
    @ranking = ranking
    @students = students
    @instructors = instructors
    SCHOOLS << self     # add current School object to SCHOOLS array
  end

  def ranking=(ranking)
    @ranking = ranking
  end

  def addstudent(student, grade, semester)
    @students << {name: student, grade: grade, semester: semester} 
  end

  def deletestudent(student)
    @students.delete_if {|stud| stud[:name] == student}
  end

  def addinstructor(instructor, subject)
    @instructors << {name: instructor, subject: subject} 
  end

# h. Create a class method reset that will empty the SCHOOLS constant.
  def self.reset
    SCHOOLS.replace([])   # normally we may not reassign constant. Use "replace" to cheat.
  end
end

def pschool(s)      # pretty output for a school
  puts "Name: #{s.name}, Location: #{s.location}, Ranking: #{s.ranking}"
  puts "Students:"
  s.students.each do |stud|
    puts stud
  end
  puts "Instructors:"
  s.instructors.each do |i|
    puts i
  end
  puts
end

s1 = School.new("Flatiron School", "Manhattan", 1)

s1.addstudent('Raymond', 'A', 'fall') 
s1.addstudent('Natalie', 'B', 'winter') 
s1.addstudent('Yvonne', 'C', 'spring') 

s1.addinstructor('Avi', 'RoR')
s1.addinstructor('Batman', 'Being a badass')

puts "School 1:"
pschool(SCHOOLS[0])

s2 = School.new("Dev Bootcamp", "San Francisco", 2)

s2.addstudent('Homer', 'F', 'fall') 
s2.addstudent('Marge', 'B', 'winter') 
s2.addstudent('Maggie', 'A', 'fall') 

s2.addinstructor('Kush', 'RoR')
s2.addinstructor('Spider-Man', 'Being snarky')
s2.addinstructor('Scarlett', 'Being Black Widow')

puts "School 2:"
pschool(SCHOOLS[1])

print "Give me new ranking for school 1: "
s1.ranking = gets.chomp.to_i

puts "Give me new student for school 1 in format 'name, grade, semester':"
new_s = gets.chomp.split(',')
s1.addstudent(new_s[0], new_s[1], new_s[2])

print "Give me name of student to delete: "
del_s = gets.chomp
s1.deletestudent(del_s)

print "Give me new ranking for school 2: "
s2.ranking = gets.chomp.to_i

puts "Give me new student for school 2 in format 'name, grade, semester':"
new_s = gets.chomp.split(',')
s2.addstudent(new_s[0], new_s[1], new_s[2])

print "Give me name of student to delete: "
del_s = gets.chomp
s2.deletestudent(del_s)

puts "--------------After all your changes--------------------"

SCHOOLS.each {|s| pschool(s)}     # print details of each school

School.reset
puts "Just emptied SCHOOLS array. What's inside?"
SCHOOLS.each {|s| pschool(s)}
puts "Nothing. SCHOOLS = []" if SCHOOLS.empty?
puts "--------------------Question 6--------------------------"


=begin
6. Classes

a. Create a Student class.
b. Change School instance methods to treat Students as array of objects instead of an array of hashes.
c. Create a method in the School class that finds a student by name and returns the correct Student object.
=end

class Student
  attr_accessor :name, :grade, :semester

  def initialize(name, grade, semester)
    @name = name
    @grade = grade
    @semester = semester
  end
end

class School
  attr_accessor :name, :location, :instructors, :students
  attr_reader :ranking

  def initialize(name, location, ranking)
    @name = name
    @location = location
    @ranking = ranking
    @students = []
    @instructors = []
    SCHOOLS << self     # add current School object to SCHOOLS array
  end

  def ranking=(ranking)
    @ranking = ranking
  end

  def addstudent(name, grade, semester)
    @students << Student.new(name, grade, semester)
  end

  def deletestudent(name)
    @students.delete_if {|stud| stud.name == name}
  end

  def findstudent(name)
    @students.find {|stud| stud.name == name}
  end

  def addinstructor(instructor, subject)
    @instructors << {name: instructor, subject: subject} 
  end

# h. Create a class method reset that will empty the SCHOOLS constant.
  def self.reset
    SCHOOLS.replace([])   # normally we may not reassign constant. Use "replace" to cheat.
  end
end

def pschool(s)      # pretty output for a school
  puts "Name: #{s.name}, Location: #{s.location}, Ranking: #{s.ranking}"
  puts "Students:"
  s.students.each do |stud|     # each stud is an object
    puts "Name: #{stud.name}, Grade: #{stud.grade}, Semester: #{stud.semester}"
  end
  puts "Instructors:"
  s.instructors.each do |i|     # each i is a hash
    puts i
  end
  puts
end

s1 = School.new("Harvard", "Boston", 1)

s1.addstudent('Flash', 'A', 'fall') 
s1.addstudent('Irina', 'B', 'winter') 
s1.addstudent('Glenda', 'C', 'spring') 

s1.addinstructor('Robert', 'Scuba diving')
s1.addinstructor('Olga', 'Modeling')

puts "School 3:"
pschool(SCHOOLS[0])

s2 = School.new("Yale", "New Haven", 2)

s2.addstudent('Pierre', 'F', 'spring') 
s2.addstudent('Juliette', 'B', 'winter') 
s2.addstudent('Audrey', 'A', 'fall') 

s2.addinstructor('Reich', 'Government')
s2.addinstructor('Atkins', 'Chemistry')
s2.addinstructor('Judd', 'Physics')

puts "School 4:"
pschool(SCHOOLS[1])

print "Give me new ranking for school 4: "
s2.ranking = gets.chomp.to_i

puts "Give me new student for school 4 in format 'name, grade, semester':"
new_s = gets.chomp.split(',')
s2.addstudent(new_s[0], new_s[1], new_s[2])

print "Give me name of student to find: "
del_s = gets.chomp
f = s2.findstudent(del_s)
puts "Name: #{f.name}, Grade: #{f.grade}, Semester: #{f.semester}"

print "Give me name of student to delete: "
del_s = gets.chomp
s2.deletestudent(del_s)

puts "Give me new instructor for school 4 in format 'name, subject':"
new_i = gets.chomp.split(',')
s2.addinstructor(new_i[0], new_i[1])

puts "\n----------School 4 (after all your changes-------------"
pschool(SCHOOLS[1])

#7. Self

puts "--------------------Question 7--------------------------"
# a. What should this Class print to the screen when defined/loaded?

puts "7a. It prints 'hello', from class method Student.say_hello (or self.say_hello)."
puts "'puts self' makes it print 'Student'."

class Student

  def self.say_hello
    puts "hello"
  end

  say_hello
  puts self

end

# b. What should this Class print to the screen when defined/loaded?

puts "\n7b. It only prints 'Student,' since class method 'say_hello' does 'puts self', and this is the 'Student' class."

class Student

  def self.say_hello
    puts self
  end

  say_hello

end

# c. What should this Class print to the screen when defined/loaded?

puts "\n7c. It prints class name and object ID, since 'new' forces Student class to instantiate itself."

class Student

  def initialize
    puts self
  end

  new     # forces it to instantiate itself and create an object

end 

# d. What should this code print to the screen when run?

puts "\n7d. It puts class name 'Student' with object ID."

  class Student

    def say_hello
      puts self
    end

  end

Student.new.say_hello

# e. What should this code print to the screen when run?

puts "\n7e. It puts class name 'Student' with object ID (since it got instantiated), plus 'goodbye' (since 'say_goodbye' method was called."

  class Student

    def say_hello
      puts say_goodbye
    end

    def say_goodbye
      "goodbye"
    end

  end

Student.new.say_hello