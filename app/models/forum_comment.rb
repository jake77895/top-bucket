# == Schema Information
#
# Table name: forum_comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_forum_comments_on_parent_id  (parent_id)
#  index_forum_comments_on_post_id    (post_id)
#  index_forum_comments_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class ForumComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: 'ForumComment', optional: true
  has_many :replies, class_name: 'ForumComment', foreign_key: :parent_id, dependent: :destroy
end
