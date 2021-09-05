require 'test_helper'

class Admin::DesignsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_designs_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_designs_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_designs_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_designs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_designs_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_designs_update_url
    assert_response :success
  end

end
