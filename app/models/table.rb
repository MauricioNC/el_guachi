class Table < ApplicationRecord
  belongs_to :venue
  has_many :reservations

  validates :number, presence: true
  validates :capacity, presence: true, numericality: { grather_tan: 0 } 
end
