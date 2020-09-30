class AddCaptionToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :caption, :text
  end
end
