require_relative '../Components/person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknow')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [age, specialization, name]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
