class Ticket < ApplicationRecord
  validates :name, :email_address, :price, presence: true
  validates :name, length: { :minimum => 6 }

  def price_in_scope
        if (price > event.price_high) || (price < event.price_low)
            errors.add('Cena', 'Cena biletu nie miesci sie w podanym zakresie cenowym')
        end
  end
  validate :price_in_scope

  belongs_to :event
  belongs_to :user
end
