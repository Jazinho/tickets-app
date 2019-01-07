class Ticket < ApplicationRecord
  validates :name, :email_address, :price, presence: true
  validates :name, length: { :minimum => 6 }
end
