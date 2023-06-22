class Submission < ApplicationRecord
  # has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user


  has_rich_text :description

  enum :status, {draft: 0, draft_in_progress: 1, published: 2, request_in_progress: 3, request_approved: 4}, scope: false
end
