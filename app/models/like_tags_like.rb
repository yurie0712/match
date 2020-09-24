class LikeTagsLike < ApplicationRecord
  belongs_to :like_tag
  belongs_to :like
  validates :like_id, presence: true
  validates :like_tag_id, presence: true
end
