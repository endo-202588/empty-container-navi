class Admin::BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy]

  def index
    @bookings =
      Booking
        .includes(
          voyage: [
            :carrier,
            {
              route: %i[
                departure_port
                arrival_port
              ]
            }
          ]
        )
        .order(created_at: :desc)
  end

  def show
    @booking =
      Booking
        .includes(
          :user,
          voyage: [
            :carrier,
            {
              route: %i[
                departure_port
                arrival_port
              ]
            }
          ]
        )
        .find(params[:id])
  end

  def destroy
    @booking.destroy
    redirect_to admin_bookings_path, success: "削除しました"
  end

  private

  def set_voyage
    @voyage = Voyage.find(params[:voyage_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:container_type, :quantity, :cargo_name, :cargo_detail)
  end
end
