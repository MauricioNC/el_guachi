class CreateAccessEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :access_events do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :reservations, null: false, foreign_key: true
      t.integer :event_type, null: false
      t.integer :source, null: false
      t.datetime :occurred_at, null: false

      t.timestamps
    end
  end
end
