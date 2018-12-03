require 'test_helper'

class SingosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @singo = singos(:one)
  end

  test "should get index" do
    get singos_url
    assert_response :success
  end

  test "should get new" do
    get new_singo_url
    assert_response :success
  end

  test "should create singo" do
    assert_difference('Singo.count') do
      post singos_url, params: { singo: { content: @singo.content, item_id: @singo.item_id, sel: @singo.sel, user_id: @singo.user_id } }
    end

    assert_redirected_to singo_url(Singo.last)
  end

  test "should show singo" do
    get singo_url(@singo)
    assert_response :success
  end

  test "should get edit" do
    get edit_singo_url(@singo)
    assert_response :success
  end

  test "should update singo" do
    patch singo_url(@singo), params: { singo: { content: @singo.content, item_id: @singo.item_id, sel: @singo.sel, user_id: @singo.user_id } }
    assert_redirected_to singo_url(@singo)
  end

  test "should destroy singo" do
    assert_difference('Singo.count', -1) do
      delete singo_url(@singo)
    end

    assert_redirected_to singos_url
  end
end
