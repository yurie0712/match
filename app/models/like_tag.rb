class LikeTag < ApplicationRecord
  validates :tagname, presence: true, length: { maximum: 99 }
  has_and_belongs_to_many :likes
end