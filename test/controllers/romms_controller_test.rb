require "test_helper"

class RommsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get romms_index_url
    assert_response :success
  end
end
