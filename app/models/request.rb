class Request < ApplicationRecord
  belongs_to :requester, class_name: "Booking"
  belongs_to :requestee, class_name: "Booking"
end
