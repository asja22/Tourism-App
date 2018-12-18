require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get packages_home_url
    assert_response :success
  end

  test "should get new" do
    get packages_new_url
    assert_response :success
  end

  test "should get index" do
    get packages_index_url
    assert_response :success
  end

  test "should get edit" do
    get packages_edit_url
    assert_response :success
  end

  test "should get show" do
    get packages_show_url
    assert_response :success
  end

end
