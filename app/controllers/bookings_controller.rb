class BookingsController < ApplicationController
  # before_action :set_booking, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    # We run the authorize just before saving
    # so that the instance is fully set
    @course = Course.find(params[:course_id])
    @booking.course = @course
    authorize @booking
    if @booking.save
      redirect_to dashboard_bookings_path, notice: 'booking was successfully created.'
    else
      render 'courses/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(params.require(:booking).permit(:date_and_start_time, :status))
      # redirect_to # up to you...
      redirect_to dashboard_bookings_path + '?chefdashboard'
    else
      # render # where was the booking update form?
      render 'dashboard/bookings'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    # @booking = Booking.find(params[:id])
    # authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:date_and_start_time, :status)
  end
end
