class BookingsController < ApplicationController
  before_action :set_course, only: [ :update, :create]

  def update
  end

  def create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_course
    @booking = Booking.find(1)
    authorize @booking
  end
end
