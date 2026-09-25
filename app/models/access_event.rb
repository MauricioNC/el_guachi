class AccessEvent < ApplicationRecord
  belongs_to :venue
  belongs_to :reservations, optional: true

  enum :event_type, {
    entry: 0,
    exit: 1,
    reentry: 2
  }

  enum :source, {
    reservation: 0,
    general: 1
  }
end
