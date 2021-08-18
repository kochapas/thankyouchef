class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  before_action :skip_authorization
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    @courses = @courses.search(params[:query]).order('created_at DESC')
  end

  def show
    @booking = Booking.new
  end

  def new
    @course = Course.new(chef_params)
    @course.chef_profile = current_user.chef_profile
    # We run the authorize just before saving
    # so that the instance is fully set
    authorize @course
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render '/'
    end
  end

  def create
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end

  def chef_params
    params.permit(:title, :body, photos: [])
  end
end
