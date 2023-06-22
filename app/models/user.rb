class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  has_many :submissions
  has_many :subordinates, class_name: "User",
                          foreign_key: "report_to_id"

  belongs_to :report_to, class_name: "User", optional: true

  enum role: [:user, :pic, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ').titleize
  end

  def set_default_role
    self.role ||= :user
  end

end
