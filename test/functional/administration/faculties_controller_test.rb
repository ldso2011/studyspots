require 'test_helper'

class Administration::FacultiesControllerTest < ActionController::TestCase
  setup do
    @faculty = faculties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty" do
    assert_difference('Faculty.count') do
      post :create, faculty: @faculty.attributes
    end

    assert_redirected_to faculty_path(assigns(:faculty))
  end

  test "should show faculty" do
    get :show, id: @faculty.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty.to_param
    assert_response :success
  end

  test "should update faculty" do
    put :update, id: @faculty.to_param, faculty: @faculty.attributes
    assert_redirected_to faculty_path(assigns(:faculty))
  end

  test "should destroy faculty" do
    assert_difference('Faculty.count', -1) do
      delete :destroy, id: @faculty.to_param
    end

    assert_redirected_to faculties_path
  end
end
