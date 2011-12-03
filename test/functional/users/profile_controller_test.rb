require 'test_helper'

class Users::ProfileControllerTest < ActionController::TestCase
  test "should get users/profile" do
    get :users/profile
    assert_response :success
  end

end
