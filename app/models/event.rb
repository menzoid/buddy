class Event < ApplicationRecord
  belongs_to :category
  has_many :bookings
  has_one_attached :photo
  
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }
end
