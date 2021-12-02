class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :intention
  has_many :requests_as_requester, class_name: "Request", foreign_key: :requester_id
  has_many :requests_as_requestee, class_name: "Request", foreign_key: :requestee_id
end
