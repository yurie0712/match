class CreatePostTagsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags_posts do |t|
      t.references :post, index: true, foreign_key: true
      t.references :post_tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
