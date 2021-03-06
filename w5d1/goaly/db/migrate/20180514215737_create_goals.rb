class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.string :visibility, null: false
      t.string :status, null: false
      t.integer :cheers, null: false
      t.integer :user_id, null: false 
      t.timestamps
    end
    add_index :goals, :user_id 
    
  end
end
