require_relative '../Components/person'
require_relative '../Entities/student'
require_relative '../Entities/teacher'
require_relative 'input'
require_relative '../utils/io_file'

class PeopleOptions
  attr_accessor :people_list

  def initialize
    @people_list = []
    @people_file = IOFile.new('./data/rentals.json')
    @people_data = @people_file.read_data
    @people_list = @people_data.map { |data| People.new(data['id'], data['name'], data['age']) }
  end

  def list_all_people
    if @people_list.empty?
      puts 'No record found! Add a person...'
    else
      puts 'All people in the library'
      @people_list.each_with_index do |person, index|
        puts "[#{index}][#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    person_role = Input.user_input('Do you want to create a student(1) or a teacher(2)? [Input the number] ')
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please add a valid input!'
    end
  end

  def create_student
    age = Input.user_input('Age: ').to_i
    name = Input.user_input('Name: ')
    parent_permission = Input.user_input('Has parent permission? [Y/N]: ') == 'y'
    @people_list.push(Student.new(age, name, parent_permission: parent_permission))
    puts "\nPerson created successfuly"
  end

  def create_teacher
    age = Input.user_input('Age: ').to_i
    name = Input.user_input('Name: ')
    specialization = Input.user_input('Specialization: ')
    @people_list.push(Teacher.new(age, specialization, name))
    puts "\nPerson created successfuly"
  end
end
