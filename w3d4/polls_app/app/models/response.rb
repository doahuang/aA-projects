# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id,:answer_choice_id, presence: true
  validate :respondent_already_answered?

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question


  def sibling_responses
    question #find my question
      .responses # find all responses under the question
      .where.not(id: self.id) #exlude myself
  end

  def respondent_already_answered?
    sib_with_resp = sibling_responses.includes(:respondent)

    sib_with_resp.any? do |sib|
      sib.respondent.id == self.user_id
    end

  end

end
