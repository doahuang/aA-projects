class DropColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :visits, :visitor_id
    add_column :visits, :user_id, :integer, null: false
  end
end
