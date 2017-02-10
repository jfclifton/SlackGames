require 'test_helper'

class SlackResponseControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slack_response_controller_index_url
    assert_response :success
  end

end
