class PostTagsPost < ApplicationRecord
  belongs_to :post_tag
  belongs_to :post
  validates :post_id, presence: true
  validates :post_tag_id, presence: true
end