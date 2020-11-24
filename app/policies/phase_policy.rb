# frozen_string_literal: true

class PhasePolicy < ApplicationPolicy
  def update?
    user.admin? or (user.developer? and
        record.lead.user_id == user.id)
  end

  def destroy?
    user.admin? or  (user.developer? and record.lead.user_id == user.id)
  end

  def create?
    user.admin? and  user.developer?
  end

  def status?
    user.admin? or (user.manager? and record.user_id == user.id) or (user.developer? and record.lead.user_id == user.id)
  end

  def accept?
    user.manager? and record.requests.exists?(user_id: user.id)
  end

  def reject?
    user.manager? and record.requests.exists?(user_id: user.id)
  end
end
