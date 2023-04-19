require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

mike = Person.new(2, 24, 'Mike')
thomas = Person.new(3, 56, 'Thomas')

the_power_of_brain = Book.new('The power of brain', 'Francis')
why_were_we_poor = Book.new('Why were we poor', 'Henry Ford')

class1 = Classroom.new('class1')

st1 = Student.new(4, 23, 'Luis')
st2 = Student.new(5, 20, 'Lisa')

st1.classroom = class1
st2.classroom = class1

puts st1.classroom.label
puts class1.students.count

rent1 = Rental.new('2023-03-10', the_power_of_brain, mike)
rent2 = Rental.new('2023-04-15', the_power_of_brain, thomas)

puts rent1.book.title
puts rent2.person.name
puts(the_power_of_brain.rental.map { |rental| rental.person.name })

thomas.add_rental('2022-04-09', why_were_we_poor);

puts(thomas.rental.map { |rental| rental.book.title })
