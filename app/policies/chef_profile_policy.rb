class ChefProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_is_new_chef?
  end

  def show?
    user_is_chef? && user_is_owner?
  end

  def agreement?
    !user_is_chef?
  end

  private

  def user_is_owner?
    user.chef_profile == record
  end

  def user_is_chef?
    user.chef?
  end

  def user_is_new_chef?
    user.chef_profile.id.nil?
  end
end
