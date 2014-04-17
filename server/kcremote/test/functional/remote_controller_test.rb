require 'test_helper'

class RemoteControllerTest < ActionController::TestCase
  test "should get nyuukyo" do
    get :nyuukyo
    assert_response :success
  end

end
