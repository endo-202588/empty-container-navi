class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy]
  before_action :set_voyage, only: %i[create]

  def new
    @voyage =
      Voyage
        .includes(
          :carrier,
          route: %i[
            departure_port
            arrival_port
          ]
        )
        .find(params[:voyage_id])

    @booking = Booking.new(
      container_type: params[:container_type],
      quantity: 1
    )
  end

  def create
    @booking = @voyage.bookings.new(booking_params)

    @booking.user = current_user

    if @booking.save
      BookingMailer.completed(@booking).deliver_now
      
      redirect_to @booking, success: "予約を登録しました"
    else
      render :new, status: :unprocessable_content
    end
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

  def index
    @bookings =
      current_user
        .bookings
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

  def destroy
    @booking.destroy
    redirect_to bookings_path, success: "削除しました"
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
