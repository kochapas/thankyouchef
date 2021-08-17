class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    @courses = @courses.search(params[:query]).order('created_at DESC')
  end

  def show
    @booking = Booking.new
  end

  def new
  end

  def create
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end
end
