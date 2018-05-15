class Comment < ApplicationRecord
  validates :body, :goal_id, presence: true 
  belongs_to :goal, 
    class_name: :Goal,
    foreign_key: :goal_id, 
    primary_key: :id
    
end
