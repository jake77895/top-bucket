# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string
#  content          :text             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint
#  tier_list_id     :bigint           not null
#  user_id          :bigint
#
# Indexes
#
#  index_comments_on_commentable   (commentable_type,commentable_id)
#  index_comments_on_tier_list_id  (tier_list_id)
#  index_comments_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tier_list_id => tier_lists.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :tier_list
  belongs_to :commentable, polymorphic: true, optional: true
  belongs_to :user

  validates :content, presence: true
end
