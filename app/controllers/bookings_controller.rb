class BookingsController < ApplicationController
  # before_action :set_booking, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    # We run the authorize just before saving
    # so that the instance is fully set
    @booking.course = Course.find(params[:course_id])
    authorize @booking
    if @booking.save
      redirect_to dashboard_bookings_path, notice: 'booking was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_booking
    # @booking = Booking.find(params[:id])
    # authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:date, :time_slot, :status)
  end
end
