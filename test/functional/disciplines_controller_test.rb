require 'test_helper'

class DisciplinesControllerTest < ActionController::TestCase
  setup do
    @discipline = disciplines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disciplines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discipline" do
    assert_difference('Discipline.count') do
      post :create, discipline: @discipline.attributes
    end

    assert_redirected_to discipline_path(assigns(:discipline))
  end

  test "should show discipline" do
    get :show, id: @discipline.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discipline.to_param
    assert_response :success
  end

  test "should update discipline" do
    put :update, id: @discipline.to_param, discipline: @discipline.attributes
    assert_redirected_to discipline_path(assigns(:discipline))
  end

  test "should destroy discipline" do
    assert_difference('Discipline.count', -1) do
      delete :destroy, id: @discipline.to_param
    end

    assert_redirected_to disciplines_path
  end
end
