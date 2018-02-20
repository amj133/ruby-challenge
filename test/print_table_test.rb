require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/print_table'

class PrintTableTest < Minitest::Test

  def test_it_exists
    table = PrintTable.new

    assert_instance_of PrintTable, table
  end

  def test_read_file_returns_file_contents
    table = PrintTable.new
    content = table.read_file('/data/fixtures/violations_fixture.csv')

    assert_equal 4, content.count
  end

end
