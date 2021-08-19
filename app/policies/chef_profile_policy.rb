class ChefProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_chef?
  end

  def user_is_chef?
    user.chef?
  end
end
