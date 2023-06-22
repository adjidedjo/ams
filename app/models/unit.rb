class Unit < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :form_categories, dependent: :destroy
  belongs_to :department

  validates :name, :email_approval_person, presence: true, uniqueness: true
end
