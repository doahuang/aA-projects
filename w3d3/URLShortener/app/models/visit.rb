# == Schema Information
#
# Table name: visits
#
#  id             :bigint(8)        not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  visited_url_id :integer          not null
#  user_id        :integer          not null
#

class Visit < ApplicationRecord
  validates :user_id, :visited_url_id, presence: true
  
  def self.recorded_visits!(user, shortened_url)
    create!(user_id: user.id, visited_url_id: shortened_url.id)
  end
  
  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :shorten_url,
    primary_key: :id,
    foreign_key: :visited_url_id,
    class_name: :ShortenedUrl
  
end
