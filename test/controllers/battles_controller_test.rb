require 'test_helper'

class BattlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get battles_new_url
    assert_response :success
  end

end
