class Group < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :members, dependent: :destroy
  
  has_many :memberships, class_name:  "Member", foreign_key: "group_id", dependent: :destroy
  has_many :users, through: :memberships, source: :user
end
