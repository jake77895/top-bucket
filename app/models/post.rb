# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  body          :text
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  forum_room_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_posts_on_forum_room_id  (forum_room_id)
#  index_posts_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (forum_room_id => forum_rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :forum_room
  belongs_to :user
  has_many :forum_comments, dependent: :destroy

  # If you want nested posts (optional):
  acts_as_tree order: 'created_at ASC' # or use ancestry if needed
end
