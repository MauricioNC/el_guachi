class CreateVenues < ActiveRecord::Migration[8.1]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.integer :capacity, null: false

      # Espacios apartados temporalmente para personas
      # que salieron y conservan derecho de reingre
      t.integer :reentry_reserved, default: 0, null: false

      t.timestamps
    end
  end
end
