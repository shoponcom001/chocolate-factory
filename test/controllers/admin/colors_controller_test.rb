require 'test_helper'

class Admin::ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_colors_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_colors_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_colors_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_colors_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_colors_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_colors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_colors_destroy_url
    assert_response :success
  end

end
