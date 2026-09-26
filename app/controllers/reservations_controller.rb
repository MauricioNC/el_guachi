class ReservationsController < ApplicationController
  before_action :set_table, :set_venue, only: %i[create]
  
  def show
    @reservation = Reservation.find_by(qr_token: params[:token])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reaservation_params)
    @reservation.table_id = @table_id
    @reservation.status = :pending
    @reservation.venue_id = @venue
    @reservation.qr_token = SecureRandom.alphanumeric(16)

    if @reservation.save
      redirect_to reservation_path(@reservation.qr_token)
    else
      render :new, stats: :unprocessable_entity
    end
  end

  private

  def set_table
    @table_id = Table.where(number: params[:reservation][:table_number]).pluck(:id).first
  end

  def set_venue
    @venue = Venue.first.id
  end

  def reaservation_params
    params.require(:reservation).permit(:name, :reserved_count, :starts_at)
  end
end
