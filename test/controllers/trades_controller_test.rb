require 'test_helper'

class TradesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get trades_list_url
    assert_response :success
  end

  test "should get detail" do
    get trades_detail_url
    assert_response :success
  end

end
