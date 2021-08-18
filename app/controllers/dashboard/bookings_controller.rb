module Dashboard
  class BookingsController < ApplicationController
    before_action :set_course, only: [:show, :update, :create]
    def index
      @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
      # dashboard/bookings
      if current_user.chef?
        @chef_bookings = policy_scope(Booking).where(course: current_user.chef_profile.courses).order(created_at: :desc)
        #dashboard/bookings?chefdashboard
      end
    end
    def show
    end

    def update
      @booking = Booking.find(params[:id])
      if @booking.update(booking_params)
        # redirect_to # up to you...
      else
        # render # where was the booking update form?
        render 'dashboard/bookings'
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @booking = Booking.find(params[:id])
      authorize @booking
    end

    def booking_params
    # TODO: check your model, might be different than mine
      params.require(:booking).permit(:date, :time_slot, :status)
    end
  end
end
