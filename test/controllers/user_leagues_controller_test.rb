require "test_helper"

class UserLeaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get join-league" do
    get user_leagues_join-league_url
    assert_response :success
  end
end
