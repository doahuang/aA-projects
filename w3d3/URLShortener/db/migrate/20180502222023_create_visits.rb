class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_url, null: false
      t.timestamps 
    end
    add_index :visits, :visitor_id
    add_index :visits, :visited_url
  end
end
