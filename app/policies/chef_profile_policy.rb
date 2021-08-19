class ChefProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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
end
