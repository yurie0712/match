class AddCaptionToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :caption, :text
  end
end
