require 'test_helper'

class Admin::RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ranks_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_ranks_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_ranks_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_ranks_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ranks_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_ranks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_ranks_destroy_url
    assert_response :success
  end

end
