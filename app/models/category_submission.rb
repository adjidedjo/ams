class CategorySubmission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  enum :status, {creator: 1, supervisor: 2, pic: 3}, scope: false

  def self.index_for_users(user)
    if user.report_to_id.nil?
      if user.pic?
        subs = where(last_approval: user.id).ids
        where(user_id: user.id).or(where(id: subs))
      else
        subs = user.subordinate_ids << user.id
        where(user_id: subs)
      end
    elsif user.report_to_id.present?
      where(user_id: user.id)
    elsif user.admin?
      all
    else
      where(next_stage: user.id)
    end
  end

  def self.update_stage(user, category)
    if (user.report_to_id.nil?)
      find_responsible_user(category) 
    else
      user.report_to_id
    end
  end

  def self.find_responsible_user(category)
    User.find_by_email(category.unit.email_approval_person).id
  end
end
