require_relative 'helper_spec'

describe Book do

  before :each do
    @book = Book.new('Title', 'Author')
    @person1 = Person.new(20, 'Harry')
  end

  describe "#new" do
    it "return a new book object" do
      @book.should be_an_instance_of Book
    end
  end

  describe "#title" do
    it "returns the correct title" do
      @book.title.should eql "Title"
    end
  end

  describe "#author" do
    it "returns the correct title" do
      @book.author.should eql "Author"
    end
  end

  it "adds new rental for this book" do
    @book.add_rental('2023-03-15', @person1)
    @book.rental[0].date.should eql '2023-03-15'
  end

  it "adds new rental for this book" do
    lambda { @book.add_rental('2023-03-15') }.should raise_exception ArgumentError
  end
end
