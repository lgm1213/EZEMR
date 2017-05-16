class User < ApplicationRecord
	before_save :downcase_email
	validates :username, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :gender_cd, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password


	#uses simple_enu gemm
  as_enum :gender, :Female => 1, :Male => 0

   # Returns the hash digest of a given string
  def User.digest(string)
  	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  	BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remember a User in the DB for Use in sessions that member does not want to forget/logout
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the token matches the password digest
  def authenticated?(attribue, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  #activates an account
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

    #sets the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  # sends Password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  #returns back true if the password reset has expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

private
  
  #creates an activation token
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def downcase_email
    self.email = email.downcase
  end
end
