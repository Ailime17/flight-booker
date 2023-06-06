class AddAirportRefToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :airport, null: false, foreign_key: true
  end
end
