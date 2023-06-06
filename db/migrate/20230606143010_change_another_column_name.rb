class ChangeAnotherColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :airport_id, :arrival_airport_id
  end
end