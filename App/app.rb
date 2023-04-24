require_relative '../Modules/book_options'
require_relative '../Modules/people_options'
require_relative '../Modules/rental_options'

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
    @book_options = BookOptions.new
    @people_options = PeopleOptions.new
    @rental_options = RentalOptions.new(@book_options, @people_options)
  end

  def show_command
    puts '*' << ('=' * 50) << '*'
    puts LIST_COMMAND
    puts '*' << ('=' * 50) << '*'
  end

  def run key_option
    case key_option
    when '1'
      @book_options.list_all_books
    when '2'
      @people_options.list_all_people
    when '3'
      @people_options.create_person
    when '4'
      @book_options.create_book
    when '5'
      @rental_options.create_rental
    when '6'
      @rental_options.list_rentals
    else
      puts 'You enter invalid key, please try again' unless key_option == '7'
    end
  end
end
