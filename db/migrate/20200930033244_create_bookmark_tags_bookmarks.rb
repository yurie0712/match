class CreateBookmarkTagsBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmark_tags_bookmarks do |t|
      t.references :bookmark, index: true, foreign_key: true
      t.references :bookmark_tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
