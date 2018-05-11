class CreateUserSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_sessions do |t|
      t.integer :user_id, null: false
      t.string :token_of_session, null: false
      t.timestamps
    end
    add_index :user_sessions, :user_id
  end
end
