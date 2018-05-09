# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(APPROVED DENIED PENDING) }
  # validate 
  
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    curr_cat = Cat.find(cat_id)
    curr_cat_requests = curr_cat.rental_requests
    
    curr_cat_requests
      # .select
      .where.not(id: self.id)
      .where.not('end_date < :start_date', start_date: self.start_date)
      .where.not('start_date > :end_date', end_date: self.end_date)
  end
  
  def overlapping_approved_requests
    # overlapping_requests
  end
    
end







