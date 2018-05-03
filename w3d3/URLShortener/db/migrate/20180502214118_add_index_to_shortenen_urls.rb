class AddIndexToShortenenUrls < ActiveRecord::Migration[5.1]
  def change
    add_index :shortened_urls, :request_user_id
  end
end
