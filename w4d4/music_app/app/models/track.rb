# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, presence: true 
  
  belongs_to :album
end
