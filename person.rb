require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name = 'Unknow')
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = true
  end

  def of_age?
    return true if @age > 18

    false
  end

  private :of_age?

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end
end
