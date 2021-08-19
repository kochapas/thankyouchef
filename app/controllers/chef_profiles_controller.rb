class ChefProfilesController < ApplicationController
  # before_action :skip_authorization

  def show
    @chef_profile = ChefProfile.find(params[:id])
    @course = Course.new
    authorize @chef_profile
  end

  def create
    @chef_profile = ChefProfile.new(chef_params)
    @chef_profile.user = current_user
    # We run the authorize just before saving
    # so that the instance is fully set
    authorize @chef_profile
    if @chef_profile.save
      redirect_to @chef_profile, notice: 'Chef profile was successfully created.'
    else
      # render '/'
      redirect_to chef_profile_path(@chef_profile)
    end
  end

  def chef_params
    params.require(:chef_profile).permit(:years_exp)
  end
end
