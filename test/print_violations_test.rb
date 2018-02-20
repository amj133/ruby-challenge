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

end
