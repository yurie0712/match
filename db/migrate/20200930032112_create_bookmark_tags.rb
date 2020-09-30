class CreateBookmarkTags < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmark_tags do |t|
      t.string :tagname

      t.timestamps
    end
    add_index :bookmark_tags, :tagname, unique: true
  end
end
