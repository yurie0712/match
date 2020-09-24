class CreateLikeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :like_tags do |t|
      t.string :tagname

      t.timestamps
    end
    #タグにindexを張る
    add_index :like_tags, :tagname, unique: true
  end
end
