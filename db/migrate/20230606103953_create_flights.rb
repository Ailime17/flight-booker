class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.float :duration_in_hours

      t.timestamps
    end
  end
end
