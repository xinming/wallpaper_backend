require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get redirect_to_iphone" do
    get :redirect_to_iphone
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
