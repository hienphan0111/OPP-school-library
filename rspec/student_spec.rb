require_relative 'helper_spec'

describe Student do

    before :each do
        @student = Student.new(23,"John",yes)
    end
    
    describe "#age" do
        it "return students age" do
            @student.age.should eql 23
        end
    end

    describe "#name" do
        it "return students name" do
            @student.age.should eql "John"
        end
    end

    describe "#parent_permission" do
        it "return parent permission" do
            @student.age.should eql yes
        end
    end