# frozen_string_literal: true

class RolePolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def create?
    user.admin?
  end

  def index?
    user.admin?
  end
end
