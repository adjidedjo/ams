require "application_system_test_case"

class FormCategoriesTest < ApplicationSystemTestCase
  setup do
    @form_category = form_categories(:one)
  end

  test "visiting the index" do
    visit form_categories_url
    assert_selector "h1", text: "Form categories"
  end

  test "should create form category" do
    visit form_categories_url
    click_on "New form category"

    fill_in "Name", with: @form_category.name
    fill_in "Unit", with: @form_category.unit_id
    click_on "Create Form category"

    assert_text "Form category was successfully created"
    click_on "Back"
  end

  test "should update Form category" do
    visit form_category_url(@form_category)
    click_on "Edit this form category", match: :first

    fill_in "Name", with: @form_category.name
    fill_in "Unit", with: @form_category.unit_id
    click_on "Update Form category"

    assert_text "Form category was successfully updated"
    click_on "Back"
  end

  test "should destroy Form category" do
    visit form_category_url(@form_category)
    click_on "Destroy this form category", match: :first

    assert_text "Form category was successfully destroyed"
  end
end
