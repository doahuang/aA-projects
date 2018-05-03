class AddIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :visits, :user_id
  end
end
