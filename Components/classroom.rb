class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def student=(student)
    @students << student unless @students.include?(student)
    student.classroom = self
  end
end
