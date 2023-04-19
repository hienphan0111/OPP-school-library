require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(id, age, name = 'Unknow', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @rental = []
    @parent_permission = parent_permission
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

  def add_rental(date, book)
    @rental << Rental.new(date, book, self)
  end
end
