require "test_helper"

class PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get plans_destroy_url
    assert_response :success
  end
end
