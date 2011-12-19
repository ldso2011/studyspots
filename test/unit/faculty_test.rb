require 'test_helper'

class FacultyTest < ActiveSupport::TestCase
  test "Insert_Faculty" do
    faculty = Faculty.new
    faculty.faculty_id = UUIDTools::UUID.timestamp_create().to_s
    faculty.acronym = "FEUP"
    faculty.faculty_type = 0
    faculty.name = "Faculdade de Engenharia da Universidade do Porto"
    faculty.url = "http://www.fe.up.pt/"
    assert faculty.save, "Devia inserir com sucesso!"
  end
  test "Dont_Insert_Faculty_Without_Id" do
    faculty = Faculty.new
    faculty.acronym = "FEUP"
    faculty.faculty_type = 0
    faculty.name = "Faculdade de Engenharia da Universidade do Porto"
    faculty.url = "http://www.fe.up.pt/"
    assert !faculty.save, "Nao devia dar sucesso sem id!"
  end
end
