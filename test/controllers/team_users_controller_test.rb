require 'test_helper'

class TeamUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_users_index_url
    assert_response :success
  end

end
