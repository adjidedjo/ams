class CategorySubmissionPolicy < ApplicationPolicy
    attr_reader :user, :category_submission

    def initialize(user, category_submission)
      @user = user
      @category_submission = category_submission
    end
  
    def next_approve?
      user.admin? || category_submission.next_stage == user.id and not category_submission.published?
    end

    def supervisor?
      user.report_to.nil?
    end
end