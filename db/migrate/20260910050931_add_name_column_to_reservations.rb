class AddNameColumnToReservations < ActiveRecord::Migration[8.1]
  def change
    add_column :reservations, :name, :string, null: false
  end
end
