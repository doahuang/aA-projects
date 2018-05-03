class DropColumnInVisits < ActiveRecord::Migration[5.1]
  def change
    remove_column :visits, :visited_url
  end
end
