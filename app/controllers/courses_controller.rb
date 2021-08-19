class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]
  def index

    # @courses = policy_scope(Course).order(created_at: :desc)
    # @courses = @courses.search(params[:query]).order('created_at DESC')
    if params[:query].present?
      @courses = policy_scope(Course).order(created_at: :desc)
      # raise
      # @courses = @courses.search(params[:query]).order('created_at DESC')
      @courses = @courses.search_by_name_and_description(params[:query])
    else
      @courses = policy_scope(Course).order(created_at: :desc)
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @course = Course.new
    authorize @course
    # We run the authorize just before saving
    # so that the instance is fully set
  end

  def create
    @course = Course.new(course_params)
    authorize @course
    @chef_profile = current_user.chef_profile
    @course.chef_profile = @chef_profile
    if @course.save
      redirect_to chef_profile_path(@chef_profile), notice: 'Course was successfully created.'
    else
      redirect_to chef_profile_path(@chef_profile), alert: "Failed to create course. #{@course.errors.full_messages.join(', ')}."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end

  def course_params
    params.require(:course).permit(:chef_profile, :name, :description,
                                   :cuisine_type, :duration, :price, :photo)
  end
end
