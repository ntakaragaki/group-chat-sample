class User < ApplicationRecord
  has_many :chat, dependent: :destroy
  validates :login_id, presence: true, length: { maximum: 30 }
  has_secure_password
end
