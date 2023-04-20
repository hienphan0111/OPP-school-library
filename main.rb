require_relative 'app'

class Main
  app = App.new

  key = '0'
  until key == '7'
    app.run
    key = gets.chomp
    case key
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rental
    when '7'
      puts 'Thank you for using this app!'
    else
      puts 'You enter invalid key, please try again'
    end
  end
end
