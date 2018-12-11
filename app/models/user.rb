class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, presence: true

  validates :email, presence: true, confirmation: { case_sensitive: false }
  #validates :email, confirmation: { case_sensitive: false }

  validates :password, confirmation: true, length: { minimum: 5 }
  # validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    find_user = User.find_by_email(email.downcase)
    true if find_user&.authenticate(password)
  end

  private

  def downcase_email
    self.email = email.downcase unless email.nil?
  end


end
