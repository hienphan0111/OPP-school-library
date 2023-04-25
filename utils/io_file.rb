require 'json'

class IOFile
  attr_accessor :file

  def initialize(file_name)
    @path = File.expand_path(file_name)
    @file = File.exist?(@path) ? File.open(@path) : File.new(file_name, 'r')
  end

  def read_data
    data = @file.read
    JSON.parse(data)
  end

  def write_data(data)
    @file.open(@path, 'w')
    @file.puts(JSON.generate(data))
    @file.close
  end
end
