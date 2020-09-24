class CreateLikeTagsLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :like_tags_likes do |t|
      t.references :like, index: true, foreign_key: true
      t.references :like_tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
