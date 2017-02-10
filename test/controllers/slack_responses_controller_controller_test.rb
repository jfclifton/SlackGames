require 'test_helper'

class SlackResponsesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slack_responses_controller_index_url
    assert_response :success
  end

end
