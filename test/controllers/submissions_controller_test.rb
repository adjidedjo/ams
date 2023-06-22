require "test_helper"

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_url
    assert_response :success
  end

  test "should create submission" do
    assert_difference("Submission.count") do
      post submissions_url, params: { submission: { attachment: @submission.attachment, category_id: @submission.category_id, contact_person: @submission.contact_person, date_required: @submission.date_required, description: @submission.description, quantity: @submission.quantity, title: @submission.title, unit: @submission.unit } }
    end

    assert_redirected_to submission_url(Submission.last)
  end

  test "should show submission" do
    get submission_url(@submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_url(@submission)
    assert_response :success
  end

  test "should update submission" do
    patch submission_url(@submission), params: { submission: { attachment: @submission.attachment, category_id: @submission.category_id, contact_person: @submission.contact_person, date_required: @submission.date_required, description: @submission.description, quantity: @submission.quantity, title: @submission.title, unit: @submission.unit } }
    assert_redirected_to submission_url(@submission)
  end

  test "should destroy submission" do
    assert_difference("Submission.count", -1) do
      delete submission_url(@submission)
    end

    assert_redirected_to submissions_url
  end
end
