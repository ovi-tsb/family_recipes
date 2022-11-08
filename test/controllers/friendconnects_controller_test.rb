require 'test_helper'

class FriendconnectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friendconnect = friendconnects(:one)
  end

  test "should get index" do
    get friendconnects_url
    assert_response :success
  end

  test "should get new" do
    get new_friendconnect_url
    assert_response :success
  end

  test "should create friendconnect" do
    assert_difference('Friendconnect.count') do
      post friendconnects_url, params: { friendconnect: { create: @friendconnect.create, destroy: @friendconnect.destroy, friend_id: @friendconnect.friend_id, user_id: @friendconnect.user_id } }
    end

    assert_redirected_to friendconnect_url(Friendconnect.last)
  end

  test "should show friendconnect" do
    get friendconnect_url(@friendconnect)
    assert_response :success
  end

  test "should get edit" do
    get edit_friendconnect_url(@friendconnect)
    assert_response :success
  end

  test "should update friendconnect" do
    patch friendconnect_url(@friendconnect), params: { friendconnect: { create: @friendconnect.create, destroy: @friendconnect.destroy, friend_id: @friendconnect.friend_id, user_id: @friendconnect.user_id } }
    assert_redirected_to friendconnect_url(@friendconnect)
  end

  test "should destroy friendconnect" do
    assert_difference('Friendconnect.count', -1) do
      delete friendconnect_url(@friendconnect)
    end

    assert_redirected_to friendconnects_url
  end
end
