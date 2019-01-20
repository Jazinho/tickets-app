class Event < ApplicationRecord
  def event_date_not_from_past
        if event_date < Date.today
            errors.add('Data wydarzenia', 'nie może być z przeszłości')
        end
  end

  validates :artist, :price_low, :price_high, :event_date, presence: true
  validates :price_low, :price_high, numericality: true

  validates_numericality_of :price_high, :greater_than => :price_low
  validate :event_date_not_from_past

  has_many :tickets
end
