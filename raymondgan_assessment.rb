#1. Arrays

array = ["Blake", "Ashley", "Jeff"]
array << "Raymond"
p array
puts array[1]               # prints "Ashley"
puts array.index('Jeff')    # prints "2"
puts

#2. Hashes

instructor = {name: "Ashley", age: 27}  # Ruby 1.9 syntax for hashes
instructor[:location] = 'NYC'
puts instructor
puts instructor[:name]  # prints "Ashley"
p instructor.key(27)    # prints ":age"
puts

#3. Nested structures

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

school[:students] << {name: "Raymond", grade: "A"}  # :students is array of hashes
 
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
  puts s[:name] if s[:grade] == "B"     # prints "Marissa"
end
 
# h. Return the subject of the instructor "Jeff".

puts school[:instructors][2][:subject]  # prints "karaoke"

=begin   --- more general solution ---
school[:instructors].each do |instructor|
  puts instructor[:subject] if instructor[:name] == "Jeff"
end
=end

puts
 
# i. Write a statement to print out all the values in the school. 

puts school.values      # prints values of only top-level keys
puts

# prints values of everything, including nested hashes
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

# a. i. Create a method to return the grade of a student, given that student's name. 

def grade(student, school)
  school[:students].each do |s|
    return s[:grade] if s[:name] == student
  end
end

student = 'Marissa'
puts "#{student}'s grade is #{grade(student, school)}"

# ii. Then use it to refactor your work in 3.i.
 
# b. i.Create a method to udpate a instructor's subject given the instructor and the new subject. 
 
# ii. Then use it to update Blake's subject to "being terrible".
 
# c. i. Create a method to add a new student to the schools student array. 
 
# ii. Then use it to add yourself to the school students array.
 
# d. i. Create a method that adds a new key at the top level of the school hash, given a key and a value. 
 
# ii. Then use it to add a "Ranking" key with the value 1.

#5. Object orientation

#6. Classes

#7. Self
