require_relative '../Components/book'

class Test
  def sum(a, b)
    a + b
  end

end

describle Test do
  context 'When testing the Test class' do
    it 'should be 3 when we call the sum(1,2) method' do
      ts = Test.new
      s = ts.sum(1, 2)
      expect(s).to eq 3
    end
  end
end
