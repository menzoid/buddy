class Request < ApplicationRecord
  belongs_to :requester, class_name: "Booking"
  belongs_to :requestee, class_name: "Booking"

  enum status: { pending: 1, accepted: 2, rejected: 3 }
end
