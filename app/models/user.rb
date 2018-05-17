class User < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :members, foreign_key: "user_id", dependent: :destroy
  has_many :groups, through: :members
  validates :login_id, presence: true, length: { maximum: 30 }
  has_secure_password
end
