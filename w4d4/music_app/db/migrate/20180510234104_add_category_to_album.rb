class AddCategoryToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :studio, :boolean, default: true, null: false
  end
end
