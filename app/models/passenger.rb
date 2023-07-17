class Passenger < ApplicationRecord
  belongs_to :booking
  validates :email, presence: true
  validates :name, presence: true
end
