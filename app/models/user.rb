# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  is_interview_coach     :boolean          default(FALSE), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_name              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_user_name             (user_name) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules.
  attr_accessor :login

  # Comments for tier lists
  has_many :comments, dependent: :destroy

  # Mock interview profile
  has_one :mock_interview_profile, dependent: :destroy

  # Career coach profile
  has_one :interview_coach, dependent: :destroy

  # Accepts or rejects mock interview
  has_many :created_mock_interviews, class_name: "MockInterview", foreign_key: :created_by_id, dependent: :destroy
  has_many :accepted_mock_interviews, class_name: "MockInterview", foreign_key: :accepted_by_id, dependent: :nullify

  # Posts for forums
  has_many :posts, dependent: :destroy

  has_many :questions_users
  has_many :questions, through: :questions_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, uniqueness: true


  # In the User model
  def mock_interview_profile
    MockInterviewProfile.find_by(user_id: id)
  end

  # Override Devise email requirement
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id] # Add minimal attributes needed to traverse
  end

  def self.ransackable_associations(auth_object = nil)
    %w[mock_interview_profile] # Allow access to the mock_interview_profile association
  end

# Allow sign-in with either username or email
def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  login = conditions.delete(:login)
  if login
    where(conditions).where(
      ["lower(user_name) = :value OR lower(email) = :value", { value: login.downcase }]
    ).first
  else
    where(conditions).first
  end
end

end
