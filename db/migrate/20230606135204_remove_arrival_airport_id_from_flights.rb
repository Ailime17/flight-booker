class RemoveArrivalAirportIdFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :arrival_airport_id, :integer
  end
end
