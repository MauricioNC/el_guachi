class AddDefaultValueToQrTokenColumnFromReservationsTable < ActiveRecord::Migration[8.1]
  def change
    change_column :reservations, :qr_token, :string, null: false, default: -> { "md5(random()::text)" }
  end
end
