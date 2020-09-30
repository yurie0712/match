class BookmarksBookmarkTag < ApplicationRecord
  belongs_to :bookmark_tag
  belongs_to :bookmark
  validates :bookmark_id, presence: true
  validates :bookmark_tag_id, presence: true
end
