require_relative '../Components/rental'
require_relative 'input'
require_relative '../utils/io_file'

class RentalOptions
  attr_accessor :rentals_list

  def initialize(book_options, people_options)
    @book_options = book_options
    @people_options = people_options
    @rental_file = IOFile.new('./data/rentals.json')
    @rental_data = @rental_file.read_data
    @rentals_list = @rental_data.map { |data| Rental.new(data['date'], data['book'], data['person']) }
  end

  def select(label, option)
    puts label
    case option
    when 'book'
      @book_options.list_all_books
    when 'person'
      @people_options.list_all_people
    end
    gets.chomp.to_i
  end

  def create_rental
    book_num = select('Select a book from the following list by number', 'book')
    person_num = select('Select a book from the following list by number', 'person')

    date = Input.user_input('Date: ')
    @rentals_list.push(Rental.new(date, @book_options.books_list[book_num], @people_options.people_list[person_num]))
    @rental_data << { 'date' => date, 'book' => @book_options.books_list[book_num],
                      'person' => @people_options.people_list[person_num] }
    @rental_file.write_data(@rental_data)
    puts 'Rental created successfully'
  end

  def list_rentals
    id = select('Select a person from the following list by id ', 'person')

    puts 'Rentals:'
    @rentals_list.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
