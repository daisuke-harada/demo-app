require "test_helper"

class RommsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get romms_show_url
    assert_response :success
  end
end
