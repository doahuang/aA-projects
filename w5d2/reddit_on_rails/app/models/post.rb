# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :sub_id, :author_id, presence: true 
  
  belongs_to :author, 
    class_name: :User 
    
  # belongs_to :sub
  
  def sub_ids
    PostSub
      .where(post_id: self.id)
      .pluck(:sub_id)
  end
  
end
