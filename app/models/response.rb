class Response < ApplicationRecord
  belongs_to :category
  belongs_to :question
  has_many :answers
end
