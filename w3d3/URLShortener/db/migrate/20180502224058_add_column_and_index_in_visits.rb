class AddColumnAndIndexInVisits < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :visited_url_id, :integer, null: false
    add_index :visits, :visited_url_id
  end
end
