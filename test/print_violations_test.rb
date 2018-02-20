require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/print_violations'

class PrintViolationsTest < Minitest::Test

  def test_it_exists
    table = PrintViolations.new

    assert_instance_of PrintViolations, table
  end

  def test_read_file_returns_CSV_class
    table = PrintViolations.new

    content = table.read_file('data/fixtures/violations_fixture.csv')

    assert_equal CSV, content.class
  end

  def test_print_contents_to_array_returns_array_of_contents
    table = PrintViolations.new

    content = table.print_contents_to_array('data/fixtures/violations_fixture.csv')

    assert_equal 4, content.count
    assert_equal "204851", content.first.violation_id
  end

  def test_count_by_violation_type_returns_hash
    table = PrintViolations.new

    table.print_contents_to_array('data/fixtures/violations_fixture.csv')
    count_by_violations = table.count_by_violation_type

    assert_equal({"Refuse Accumulation" => 3,
                  "Unsanitary conditions, not specified" => 1}, count_by_violations)
  end

  def test_date_of_earliest_violation
    table = PrintViolations.new

    table.print_contents_to_array('data/fixtures/violations_fixture.csv')
    earliest_violation_date = table.date_of_earliest_violation

    assert_equal "2011-01-03 00:00:00", earliest_violation_date
  end

  def test_date_of_latest_violation
    table = PrintViolations.new

    table.print_contents_to_array('data/fixtures/violations_fixture.csv')
    latest_violation_date = table.date_of_latest_violation

    assert_equal "2013-01-03 00:00:00", latest_violation_date
  end

  def test_print_table
    skip
    table = PrintViolations.new

    table.print_contents_to_array('data/fixtures/violations_fixture.csv')

    assert_equal ["Refuse Accumulation, Count: 3, Date of Earliest Violation: 2011-01-03, Date of Latest Violation: 2013-01-03\nUnsanitary conditions, not specified, Count: 1, Date of Earliest Violation: 2013-01-03, Date of Latest Violation: 2013-01-03"],
      table.print_table
  end

end
