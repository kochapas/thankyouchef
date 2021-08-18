class ChefProfilesController < ApplicationController
  before_action :skip_authorization
  def show
    @chef_profile = ChefProfile.find(params[:id])
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
      render '/'
    end
  end

  def chef_params
    params.require(:ChefProfile).permit(:years_exp, :photo)
  end
end
