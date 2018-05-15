class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true 
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, :session_token, uniqueness: true
  
  attr_reader :password
  
  after_initialize :ensure_session_token
  
  
  has_many :goals
  has_many :comments, through: :goals, source: :comments
  
  
  
  def password=(input)
    @password = input
    self.password_digest = BCrypt::Password.create(input)
  end 
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user && user.has_password?(password)
    user
  end
  
  def has_password?(input)
    BCrypt::Password.new(self.password_digest).is_password?(input)
  end
  
  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end
  
  def ensure_session_token 
    self.session_token ||= generate_session_token
  end
    
  private 
  
  def generate_session_token 
    SecureRandom.urlsafe_base64
  end 

end
