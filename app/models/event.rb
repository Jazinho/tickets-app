class Event < ApplicationRecord
  validates :artist, :price_low, :price_high, :event_date, presence: true
  validates :price_low, :price_high, numericality: true
  has_many :tickets
end
