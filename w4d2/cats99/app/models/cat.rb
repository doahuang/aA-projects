# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ApplicationRecord 
  include ActionView::Helpers::DateHelper

  validates :name, :sex, :color, :birth_date, presence: true
  validates :color, inclusion: { in: %w(white brown grey black) }
  
  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
  
  def age 
    # diff = Time.now - Time.new(birth_date)
    # (diff/3600/24/365).floor
    time_ago_in_words(birth_date)
  end
  
  
end
