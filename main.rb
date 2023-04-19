require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

mike = Person.new(2, 24, 'Mike')
thomas = Person.new(3, 56, 'Thomas')

the_power_of_brain = Book.new('The power of brain', 'Francis')

class1 = Classroom.new('class1')

st1 = Student.new(4, 23, 'Luis')
st2 = Student.new(5, 20, 'Lisa')

st1.classroom = class1
st2.classroom = class1

puts st1.classroom.label
puts class1.student.count

rt1 = Rental.new('2023-03-10', the_power_of_brain, mike)
rt1 = Rental.new('2023-04-15', the_power_of_brain, thomas)

puts rt1.book.title
puts the_power_of_brain.rental.map{ |rental| rental.person.name }
