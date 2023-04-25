require 'json'

class IOFile
  attr_accessor :file

  def initialize(file_name)
    @path = File.expand_path(file_name)
    @file = File.exist?(@path) ? File.open(@path) : File.new(file_name, 'r')
  end

  def read_data
    data = @file.read
    JSON.parse(data)
  end

  def write_data(data)
    @file.open(@path, 'w')
    @file.puts(JSON.generate(data))
    @file.close
  end
end


# require 'json'

# path = File.expand_path('data/books.json')

# file = File.open(path)

# books = JSON.parse(file.read)

# file.close

# file = File.open(path, 'w')

# aut = "John"
# tit = "when time is over"

# book = { "title" => tit, "author" => aut}

# books << book

# file.puts(JSON.generate(books))

# #puts books
# file.close
