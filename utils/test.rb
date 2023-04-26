require_relative '../Components/book'
require'json'
require_relative '../Entities/student'

# require_relative 'io_file'

book1 = Book.new('newbook', 'author')

st1 = Student.new(23, 'ssfsf', true)

st1.add_rental('dafsfasf', book1)


puts st1.rental[0].date

json1 = JSON.generate(st1)

puts json1

sobj1 = JSON.parse(json1, create_additions: true)

# puts json1

# file = IOFile.new('./utils/book_data.json')

# file.write_data({'1' => 'oone', '2' => 'two'})
# p = File.expand_path('./utils/book_data.json')
# file = File.open(p)

# puts file.read
