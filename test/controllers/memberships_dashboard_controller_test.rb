require "test_helper"

class MembershipsDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memberships_dashboard_index_url
    assert_response :success
  end
end
