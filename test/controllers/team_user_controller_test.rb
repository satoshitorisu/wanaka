require 'test_helper'

class TeamUserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get team_user_new_url
    assert_response :success
  end

end
