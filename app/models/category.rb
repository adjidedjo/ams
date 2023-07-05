class Category < ApplicationRecord
  belongs_to :unit
  has_many :questions, dependent: :destroy
  has_many :category_submissions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  has_rich_text :term_of_use
end
