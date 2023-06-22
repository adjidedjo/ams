class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type: {single_choice: 0, multiple_choice: 1, long_answer: 2, date_answer: 3}

  def self.question_type_select
    question_types.keys.map { |k| [k.titleize, k] }
  end
end
