# == Schema Information
#
# Table name: shortened_urls
#
#  id              :bigint(8)        not null, primary key
#  long_url        :string           not null
#  short_url       :string           not null
#  request_user_id :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, :request_user_id, presence: true
  validates :short_url, presence: true, uniqueness: true
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :request_user_id,
    class_name: :User
  
  has_many :visits,
    primary_key: :id,
    foreign_key: :visited_url_id,
    class_name: :Visit
    
  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor
    
  def self.random_code
    while true
      code = SecureRandom::urlsafe_base64
      return code unless self.exists?(short_url: code)
    end
  end
  
  def self.shorten_url(user, long_url)
    create!(request_user_id: user.id,
      long_url: long_url, 
      short_url: self.random_code)
  end
  
  def num_clicks
    visits.count
  end 
  
  def num_uniques
    visitors.count
  end 
  
  def num_recent_uniques
    visits
      .where('created_at > ?', 30.minutes.ago)
      .distinct
      .count
  end
end
