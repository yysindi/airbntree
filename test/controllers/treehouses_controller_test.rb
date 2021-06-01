require 'test_helper'

class TreehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get treehouses_new_url
    assert_response :success
  end

  test "should get edit" do
    get treehouses_edit_url
    assert_response :success
  end

  test "should get create" do
    get treehouses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get treehouses_destroy_url
    assert_response :success
  end

  test "should get show" do
    get treehouses_show_url
    assert_response :success
  end

  test "should get index" do
    get treehouses_index_url
    assert_response :success
  end

  test "should get update" do
    get treehouses_update_url
    assert_response :success
  end

end
