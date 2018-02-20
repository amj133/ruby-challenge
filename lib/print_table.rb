require 'pry'
require 'csv'

class PrintTable

  def read_file(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
  end

  def print_contents_to_array(file_path)
    content = read_file(file_path)
    content.map do |row|
      
    end
  end

end
