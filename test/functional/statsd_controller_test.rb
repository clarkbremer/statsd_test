require 'test_helper'

class StatsdControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
