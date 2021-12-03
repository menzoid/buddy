class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :events, through: :bookings
  has_many :requests_as_requestee, through: :bookings
  has_many :requests_as_requester, through: :bookings
  has_one_attached :photo
end
