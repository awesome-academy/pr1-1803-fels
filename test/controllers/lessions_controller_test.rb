require 'test_helper'

class LessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lessions_create_url
    assert_response :success
  end

  test "should get show" do
    get lessions_show_url
    assert_response :success
  end

  test "should get update" do
    get lessions_update_url
    assert_response :success
  end

end
