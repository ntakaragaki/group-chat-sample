class Group < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :members, foreign_key: "group_id", dependent: :destroy
  has_many :users, through: :members
end
