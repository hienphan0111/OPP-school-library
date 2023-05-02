require_relative 'helper_spec'

describe Student do

  before :each do
      @teacher = Teacher.new(23, "Computer", "John")
  end
  
  describe "#new" do
    it "returns an Teacher object belong to Teacher class" do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  describe "#age" do
      it "return teacher age" do
          expect(@teacher.age).to eql 23
      end
  end

  describe "#name" do
      it "return teacher name" do
          expect(@teacher.name).to eql "John"
      end
  end

  describe "#specialization" do
      it "return specialization of Teacher" do
          expect(@teacher.specialization).to eq "Computer"
      end
  end

  describe "#can user the services" do
    it "returns true" do
        expect(@teacher.can_use_services?).to be true
    end
  end

end