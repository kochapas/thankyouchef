class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    (user_is_chef? && user_is_owner?) || user_is_customer?
  end

  private

  def user_is_customer?
    user == record.user && record.status == "confirmed"
  end

  def user_is_owner?
    user == record.course.chef_profile.user
  end

  def user_is_chef?
    user.chef?
  end
end
