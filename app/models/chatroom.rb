class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :chatroom_users
  has_many :messages, through: :chatroom_users
  has_many :users, through: :chatroom_users
end
