class User < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :members, dependent: :destroy
  
  has_many :memberships, class_name:  "Member", foreign_key: "user_id", dependent: :destroy
  has_many :groups, through: :memberships, source: :group
  validates :login_id, presence: true, length: { maximum: 30 }
  has_secure_password
end
