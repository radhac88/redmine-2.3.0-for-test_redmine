require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get report" do
    get :report
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
