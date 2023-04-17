require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom, name = 'Unknow')
    super(id, age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
