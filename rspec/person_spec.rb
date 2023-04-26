require_relative 'helper_spec'

describe Person do

  before :each do
    @book = Book.new('Title', 'Author')
    @person1 = Person.new(20, 'Harry')
  end

  describe "#new" do
    it "return a new book object" do
      @person1.should be_an_instance_of Person
    end
  end

  describe "#name" do
    it "returns the correct name" do
      @person1.name.should eql "Harry"
    end
  end

  describe "#age" do
    it "returns the correct age" do
      @person1.age.should eql 20
    end
  end

  it "adds new rental for this person" do
    @person1.add_rental('2023-03-15', @book)
    @person1.rental[0].date.should eql '2023-03-15'
  end

  it "adds new rental for this book" do
    lambda { @person1.add_rental('2023-03-15') }.should raise_exception ArgumentError
  end
end
