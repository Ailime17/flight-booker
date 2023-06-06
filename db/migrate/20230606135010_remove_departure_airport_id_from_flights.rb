class RemoveDepartureAirportIdFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :departure_airport_id, :integer
  end
end
