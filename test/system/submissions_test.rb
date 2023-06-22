require "application_system_test_case"

class SubmissionsTest < ApplicationSystemTestCase
  setup do
    @submission = submissions(:one)
  end

  test "visiting the index" do
    visit submissions_url
    assert_selector "h1", text: "Submissions"
  end

  test "should create submission" do
    visit submissions_url
    click_on "New submission"

    fill_in "Attachment", with: @submission.attachment
    fill_in "Category", with: @submission.category_id
    fill_in "Contact person", with: @submission.contact_person
    fill_in "Date required", with: @submission.date_required
    fill_in "Description", with: @submission.description
    fill_in "Quantity", with: @submission.quantity
    fill_in "Title", with: @submission.title
    fill_in "Unit", with: @submission.unit
    click_on "Create Submission"

    assert_text "Submission was successfully created"
    click_on "Back"
  end

  test "should update Submission" do
    visit submission_url(@submission)
    click_on "Edit this submission", match: :first

    fill_in "Attachment", with: @submission.attachment
    fill_in "Category", with: @submission.category_id
    fill_in "Contact person", with: @submission.contact_person
    fill_in "Date required", with: @submission.date_required
    fill_in "Description", with: @submission.description
    fill_in "Quantity", with: @submission.quantity
    fill_in "Title", with: @submission.title
    fill_in "Unit", with: @submission.unit
    click_on "Update Submission"

    assert_text "Submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Submission" do
    visit submission_url(@submission)
    click_on "Destroy this submission", match: :first

    assert_text "Submission was successfully destroyed"
  end
end
