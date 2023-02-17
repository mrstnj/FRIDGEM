require "test_helper"

class ConsumeFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get consume_foods_new_url
    assert_response :success
  end
end
