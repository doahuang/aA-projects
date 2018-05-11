# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  studio     :boolean          default(TRUE), not null
#

class Album < ApplicationRecord
  validates :title, :year, presence: true
  
  belongs_to :band
  has_many :tracks, dependent: :destroy
  
end
