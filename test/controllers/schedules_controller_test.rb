require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get manage" do
    get schedules_manage_url
    assert_response :success
  end

end
