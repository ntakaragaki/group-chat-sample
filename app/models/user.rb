class User < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :members, foreign_key: "user_id", dependent: :destroy
  has_many :groups, through: :members
  validates :login_id, presence: true, length: { maximum: 30 }
  has_secure_password

  class << self
    # 渡された文字列のハッシュ値を返す
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
