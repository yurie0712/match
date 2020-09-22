class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.string :tagname

      t.timestamps
    end
    #タグにindexを張る
    add_index :post_tags, :tagname, unique: true
  end
end