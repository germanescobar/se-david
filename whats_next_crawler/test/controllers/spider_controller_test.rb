require 'test_helper'

class SpiderControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get spider_get_url
    assert_response :success
  end

end
