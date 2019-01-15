class Event < ApplicationRecord
  validates :artist, :price_low, :price_high, :date, presence: true
  validates :price_low, :price_high, numericality: true
end
