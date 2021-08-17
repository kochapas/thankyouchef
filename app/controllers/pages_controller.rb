class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @courses = policy_scope(Course).order(price: :desc)
    # @chefs = policy_scope(ChefProfile).order(years_exp: :desc)
  end
end
