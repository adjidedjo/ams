class HomeController < ApplicationController
  def index
    if current_user.admin?
      @category_submissions = CategorySubmission.all
    else
      @category_submissions = CategorySubmission.index_for_users(current_user)
    end
  end
end
