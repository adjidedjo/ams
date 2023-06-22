class Comment < ApplicationRecord
  belongs_to :category_submission
  belongs_to :user
end
