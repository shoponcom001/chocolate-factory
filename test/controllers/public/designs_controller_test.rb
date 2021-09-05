require 'test_helper'

class Public::DesignsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_designs_index_url
    assert_response :success
  end

end
