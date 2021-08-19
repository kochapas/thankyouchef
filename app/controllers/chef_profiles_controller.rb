class ChefProfilesController < ApplicationController
  before_action :skip_authorization
  def show
    @chef_profile = ChefProfile.find(params[:id])
    authorize @chef_profile
  end

  def create
  end
end
