require_relative '../Components/person'
require 'json'

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

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [age, name, @parent_permission]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
