require_relative 'helper_spec'

describe Classroom do

  before :each do
    @student1 = Student.new(25, 'Maximilianus', true)
    @student2 = Student.new(13, 'Zeus', false)
    @student3 = Student.new(19, 'Poseidon', true)
    @class1 = Classroom.new('Frontend')
  end

  context 'Classroom should be created' do
    it 'Created classroom should be an instance of the Classroom' do
      expect(@class1).to be_an_instance_of Classroom
    end
  end

  context 'When passed in a classname' do
    it 'Label should match the argument' do
      expect(@class1.label).to eq 'Frontend'
    end
  end

  context 'When students are added to the classroom' do
    
    it 'Student count should be zero(0) on initialization' do
      expect(@class1.students.length).to eq 0
    end

    it 'Addition of student should be possible' do
      @class1.student = @student1
      expect(@class1.students.length).to eq 1
    end

    it 'Should not permit duplicate addition' do
      @class1.student = @student1
      @class1.student = @student1
      expect(@class1.students.length).to eq 1
    end

    it 'Should permit addition multiple different students' do
      @class1.student = @student1
      @class1.student = @student2
      @class1.student = @student3
      expect(@class1.students.length).to eq 3
    end
  end
end
