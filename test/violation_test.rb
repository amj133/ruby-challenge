require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/violation'

class ViolationTest < Minitest::Test

  def test_it_exists_with_attributes
    violation = Violation.new(1, 2, 3, 4, 5, 6)

    assert_instance_of Violation, violation
    assert_equal 1, violation.violation_id
    assert_equal 2, violation.inspection_id
    assert_equal 3, violation.violation_category
    assert_equal 4, violation.violation_date
    assert_equal 5, violation.violation_date_closed
    assert_equal 6, violation.violation_type
  end

end
