require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, name = 'Unknow')
    super(id, age, name)
    # @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
