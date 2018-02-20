require 'pry'
require 'csv'
require './lib/violation'

class PrintViolations

  def read_file(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
  end

  def print_contents_to_array(file_path)
    content = read_file(file_path)
    @violations_array = content.map do |row|
      Violation.new(row[:violation_id],
                    row[:inspection_id],
                    row[:violation_category],
                    row[:violation_date],
                    row[:violation_date_closed],
                    row[:violation_type])
    end
  end

  def count_by_violation_type
    count_by_violations = Hash.new(0)
    @violations_array.each do |violation|
      count_by_violations[violation.violation_type] += 1
    end
    count_by_violations
  end

  def date_of_earliest_violation
    @violations_array.sort_by do |violation|
      violation.violation_date
    end.first.violation_date
  end

  def date_of_latest_violation
    @violations_array.sort_by do |violation|
      violation.violation_date
    end.last.violation_date
  end

end
