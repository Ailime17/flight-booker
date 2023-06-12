class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  belongs_to :passenger, inverse_of: :bookings
end
