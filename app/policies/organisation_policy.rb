class OrganisationPolicy < ApplicationPolicy
    def update?
      user.has_role? :organisation_manager, record
    end
  end