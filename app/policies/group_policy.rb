class GroupPolicy < ApplicationPolicy
    def update?
      user.has_role? :group_manager, record
    end
  end