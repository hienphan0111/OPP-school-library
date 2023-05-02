require_relative 'helper_spec'

describe Student do

  before :each do
      @student = Student.new(23,"John", true)
      @class1 = Classroom.new('Basic test')
  end
  
  describe "#new" do
    it "returns an Student object belong to Student class" do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe "#age" do
      it "return students age" do
          expect(@student.age).to eql 23
      end
  end

  describe "#name" do
      it "return students name" do
          expect(@student.name).to eql "John"
      end
  end

  describe "#parent_permission" do
      it "return parent permission" do
          expect(@student.parent_permission).to be true
      end
  end

  describe "#add classroom" do
    it "returns classroom name" do
        @student.classroom = @class1
        expect(@student.classroom.label).to eq "Basic test"
    end
  end

end