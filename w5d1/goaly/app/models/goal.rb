class Goal < ApplicationRecord
  validates :title, :details, :visibility, :status, :cheers, presence: true 
  
  belongs_to :user 
  
  has_many :comments 
  
  
    
end
