require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject(:user1) { User.create(username: 'mr anderson0', password: 'red pill') }
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }
  
  it { should validate_length_of(:password).is_at_least(6) }
  
  it { should have_many(:goals)}
  it { should have_many(:comments)}

  
  
end
