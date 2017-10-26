require 'test_helper'

class AnsersControllerTest < ActionController::TestCase
  test "should get adopt_on_off" do
    get :adopt_on_off
    assert_response :success
  end

end
