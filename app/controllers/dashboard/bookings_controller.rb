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
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @booking = Booking.find(params[:id])
      authorize @booking
    end
  end
end
