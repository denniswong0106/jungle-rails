class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: {minimum: 5}

  validates_uniqueness_of :email, :case_sensitive => false

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end
end
