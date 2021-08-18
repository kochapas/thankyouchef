class ChefProfilesController < ApplicationController
  def show
  end

  def create
    @chef_profile = ChefProfile.new(chef_params)
    @chef_profile.user = current_user
    # We run the authorize just before saving
    # so that the instance is fully set
    authorize @chef_profile
    if @chef_profile.save
      redirect_to @chef_profile, notice: 'Restaurant was successfully created.'
    else
      render '/'
    end
  end

  def chef_params
    params.require(:ChefProfile).permit(:years_exp, :photo)
  end
end
