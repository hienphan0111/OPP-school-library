class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @book.rental << self
    @person = person
    person.rental << self
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [date, book, person]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
