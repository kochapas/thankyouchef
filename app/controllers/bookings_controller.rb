class BookingsController < ApplicationController
  before_action :set_course, only: [:create]

  def create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_course
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
