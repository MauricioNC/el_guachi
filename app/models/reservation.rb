class Reservation < ApplicationRecord
  belongs_to :venue
  belongs_to :table

  has_many :access_events, dependent: :destroy

  validates :reserved_count, presence: true, numericality: { grather_than: 0 }
  validate :reserved_count_cannot_exceed_table_capacity

  enum :status, {
    pending: 0,
    confirmed: 1,
    canceled: 2,
    completed: 3,
  }

  def people_inside
    access_events.where(event_type: [:entry, :reentry]).count -
      access_events.where(event_type: :exit).count
  end

  def available_slots
    reserved_count - people_inside
  end

  def full?
    available_slots <= 0
  end

  private

  def reserved_count_cannot_exceed_table_capacity
    return unless table && reserved_count

    if reserved_count > table.capacity
      errors.add(
        :reserved_count,
        "no puede superar la capacidad de la mesa"
      )
    end
  end
end
