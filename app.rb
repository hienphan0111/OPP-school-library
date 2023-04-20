require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  LIST_COMMAND =
    %(Please choose an option by enterin a number
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit
    ).freeze

  def initialize()
    @books = []
    @people = []
    @rental = []
  end

  def run
    puts '*' << ('=' * 50) << '*'
    puts LIST_COMMAND
    puts '*' << ('=' * 50) << '*'
  end

  # List all books

  def list_books
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author:#{book.author}"
    end
  end

  # List all people

  def list_people
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Create a person

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    key = gets.chomp
    case key
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'You input invalid key'
    end
  end

  # Create a student

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    is_permission = gets.chomp.upcase == 'Y'
    @people << Student.new(age, name, is_permission)
    puts 'Person created successfully'
  end

  # Create a teacher

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  # Create a book

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created succesfully'
  end

  # Create a rental

  def create_rental
    num_book = '0'
    num_person = '0'
    print "Select a book from the following list by number:\n"
    list_books
    loop do
      num_book = gets.chomp.to_i
      num_book < @books.length ? break : (puts "Invalid key input, please input again or type 'x' to exit")
      return if num_book == 'x'
    end

    print "Select a person from following list by number (not id):\n"
    list_people
    loop do
      num_person = gets.chomp.to_i
      num_person < @people.length ? break : (puts "Invalid key input, please input again or type 'x' to exit")
      return if num_person == 'x'
    end

    print 'Date: '
    date = gets.chomp
    @rental << Rental.new(date, @books[num_book], @people[num_person])
    puts 'Rental created successfully'
  end

  # List all rentals for a given person id

  def list_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    person = @people.find { |per| per.id == id }
    person&.rental&.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title} by #{rental.book.author}\""
    end
  end
end
