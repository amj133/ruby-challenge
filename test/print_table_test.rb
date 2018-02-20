require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/print_table'

class PrintTableTest < Minitest::Test

  def test_it_exists
    table = PrintTable.new

    assert_instance_of PrintTable, table
  end

  def test_read_file_returns_CSV_class
    table = PrintTable.new
    content = table.read_file('data/fixtures/violations_fixture.csv')

    assert_equal CSV, content.class
  end

  def test_print_contents_to_array_returns_array_of_contents
    table = PrintTable.new
    content = table.print_contents_to_array('data/fixtures/violations_fixture.csv')


  end

end
