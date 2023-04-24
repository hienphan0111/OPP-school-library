require_relative '../Components/person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name)
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
