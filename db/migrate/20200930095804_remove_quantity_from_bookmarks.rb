class RemoveQuantityFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :quantity, :string
  end
end
