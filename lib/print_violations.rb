require 'pry'
require 'csv'
require './lib/violation'

class PrintViolations

  def read_file(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
  end

  def print_contents_to_array(file_path)
    content = read_file(file_path)
    content.map do |row|
      Violation.new(row[:violation_id],
                    row[:inspection_id],
                    row[:violation_category],
                    row[:violation_date],
                    row[:violation_date_closed],
                    row[:violation_type])
    end
  end

end
