require "test_helper"

class FormCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_category = form_categories(:one)
  end

  test "should get index" do
    get form_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_form_category_url
    assert_response :success
  end

  test "should create form_category" do
    assert_difference("FormCategory.count") do
      post form_categories_url, params: { form_category: { name: @form_category.name, unit_id: @form_category.unit_id } }
    end

    assert_redirected_to form_category_url(FormCategory.last)
  end

  test "should show form_category" do
    get form_category_url(@form_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_category_url(@form_category)
    assert_response :success
  end

  test "should update form_category" do
    patch form_category_url(@form_category), params: { form_category: { name: @form_category.name, unit_id: @form_category.unit_id } }
    assert_redirected_to form_category_url(@form_category)
  end

  test "should destroy form_category" do
    assert_difference("FormCategory.count", -1) do
      delete form_category_url(@form_category)
    end

    assert_redirected_to form_categories_url
  end
end
