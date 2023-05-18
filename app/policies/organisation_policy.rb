class OrganisationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.superadmin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
