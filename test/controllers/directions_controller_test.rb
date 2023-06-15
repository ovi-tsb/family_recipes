require 'test_helper'

class DirectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get sort" do
    get directions_sort_url
    assert_response :success
  end

end
