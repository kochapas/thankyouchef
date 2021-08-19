class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    # raise
    true
    # user_is_chef? && user_is_owner?
  end

  private

  def user_is_owner?
    user == record.chef_profile.user
  end

  def user_is_chef?
    user.chef?
  end
end
