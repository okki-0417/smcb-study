class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  VALID_EMAIL_FORMAT   = %r(\A[\w._ \-?+/]+@[\w.-]+\.\w{2,}\z)
  validates :email, presence: true,
                    length: { maximum: 256 },
                    format: { with: VALID_EMAIL_FORMAT },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 256 }
  has_secure_password
end
