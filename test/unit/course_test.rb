require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Insert_Course" do
    course = Course.new
    course.acronym = "MIEIC"
    course.faculty_id = faculties(:FEUP).faculty_id
    course.name = "Mestrado Integrado em Engenharia Informatica e Computacao"
    assert !course.save
  end
end
