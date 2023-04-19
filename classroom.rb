class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def sutdent=(student)
    @students << student
    student.classroom = self unless student.classroom.include?(self)
  end
end
