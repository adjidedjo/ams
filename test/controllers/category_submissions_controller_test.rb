require "test_helper"

class CategorySubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get category_submissions_show_url
    assert_response :success
  end

  test "should get create" do
    get category_submissions_create_url
    assert_response :success
  end
end
