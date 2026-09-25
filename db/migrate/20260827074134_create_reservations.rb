class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.string :qr_token, null: false
      t.integer :reserved_count, null: false
      t.integer :status, null: false, default: 0
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
