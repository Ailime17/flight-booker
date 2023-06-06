class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :airport_id, :departure_airport_id
  end
end
