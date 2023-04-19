class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  def sutdent=(student)
    @student << student
    student.classroom = self unless student.classroom.include?(self)
  end
end
