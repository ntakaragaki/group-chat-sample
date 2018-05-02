class User < ApplicationRecord
  validates :login_id, presence: true, length: { maximum: 50 }
  has_secure_password
end
