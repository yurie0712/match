class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.string :title
      t.string :quantity

      t.timestamps
    end
  end
end