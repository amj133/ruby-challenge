class Violation
  attr_reader :violation_id,
              :inspection_id,
              :violation_category,
              :violation_date,
              :violation_date_closed,
              :violation_type

  def initialize(violation_id,
                 inspection_id,
                 violation_category,
                 violation_date,
                 violation_date_closed,
                 violation_type)
    @violation_id = violation_id
    @inspection_id = inspection_id
    @violation_category = violation_category
    @violation_date = violation_date
    @violation_date_closed = violation_date_closed
    @violation_type = violation_type
  end

end
