require_relative '../Components/book'
require_relative 'input'
require_relative '../utils/io_file'

class BookOptions
  attr_accessor :books_list

  def initialize
    @books_file = IOFile.new('./data/books.json')
    @book_data = @books_file.read_data
    @books_list = @book_data.map { |data| Book.new(data['title'], data['author']) }
  end

  def list_all_books
    if @books_list.empty?
      puts 'No record found! Add some books...'
    else
      puts 'Available books in the library'
      @books_list.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def create_book
    title = Input.user_input('Title: ')
    author = Input.user_input('Author: ')
    @books_list.push(Book.new(title, author))
    @book_data << { 'title' => title, 'author' => author }
    @books_file.write_data(@book_data)
    puts 'Book created successfully'
  end
end
