class Venue < ApplicationRecord
  has_many :tables
  has_many :reservations
  has_many :access_events
end
