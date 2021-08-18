module Dashboard
  class BookingsController < ApplicationController
    before_action :set_course, only: [:show, :update, :create]
    def index
      if current_user.chef?
        @chefs_bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
      else
        @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
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
