class User < ApplicationRecord
  validates :session_token, presence: true
  validates :user_name, presence: true
  validates :password_digest, presence: { message: "password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token
  attr_reader :password

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat, dependent: :destroy

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :CatRentalRequest, dependent: :destroy

  has_many :user_sessions,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :UserSession

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.current_session_token.token_of_session = self.class.generate_session_token
    # self.session_token = self.class.generate_session_token
    self.save!
    # self.session_token
    self.current_session_token.token_of_session
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # ####
  def current_session_token
    self.user_sessions
      .find_by(token_of_session: self.session_token)
  end

  private
  def ensure_session_token
    # self.session_token ||= self.class.generate_session_token
    self.current_session_token.token_of_session ||= self.class.generate_session_token
  end
end
