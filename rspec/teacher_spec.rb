require_relative 'helper_spec'

describe Teacher do

    before :each do
        @teacher = Teacher.new(40,"John")
    end
    
    describe "#age" do
        it "return teachers age" do
            @student.age.should eql 40
        end
    end

    describe "#name" do
        it "return students name" do
            @student.age.should eql "John"
        end
    end
    end