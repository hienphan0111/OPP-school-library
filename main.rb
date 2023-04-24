require_relative './App/app'

class Main
  app = App.new

  key = '0'
  until key == '7'
    app.show_command
    key = gets.chomp
    app.run(key)
  end
  puts 'Thank you for using this app!'
end
