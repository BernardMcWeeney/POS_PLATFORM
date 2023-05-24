class MembershipsDashboardController < ApplicationController
  def index
    @organisation_memberships = OrganisationMembership.all
    @group_memberships = GroupMembership.all
    @location_memberships = LocationMembership.all
  end
end
