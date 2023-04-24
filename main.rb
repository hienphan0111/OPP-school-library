require_relative './App/app'

class Main
  app = App.new

  key = '0'
  until key == '7'
    app.show_command
    key = gets.chomp
    app.run(key)
    puts 'You enter invalid key, please try again' unless ('1'..'7').include?(key)
  end
  puts 'Thank you for using this app!'
end
