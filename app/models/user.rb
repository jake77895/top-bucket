# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
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

  # Posts for forums
  has_many :posts, dependent: :destroy

  has_many :questions_users
  has_many :questions, through: :questions_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, uniqueness: true

  # Override Devise email requirement
  def email_required?
    false
  end

  def email_changed?
    false
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
