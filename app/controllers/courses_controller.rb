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
      # @chef_profile = ChefProfile.all
      # @chef_profile = @chef_profile.where(id: @courses)
    else
      @courses = policy_scope(Course).order(created_at: :desc)
    end

    @locations = User.where.not(latitude: nil, longitude: nil)
    @locations = @locations.joins(:chef_profile)
    @chef_profile = ChefProfile.all
    @markers = @locations.geocoded.map do |location| {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "/courses/map_box", locals: { location: location })
    }
    end
  end

  def show
    @courses = policy_scope(Course).order(created_at: :desc)
    @booking = Booking.new
    @locations = User.where.not(latitude: nil, longitude: nil)
    @locations = @course.user
    @locations = [@locations]
    @chef_profile = ChefProfile.all
    @markers = @locations.map do |location| {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "/courses/map_box_chef", locals: { location: location })
    }
    end
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
      redirect_to chef_profile_path(@chef_profile), alert: 'Failed to create course.'
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
