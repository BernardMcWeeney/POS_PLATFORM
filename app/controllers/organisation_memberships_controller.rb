class OrganisationMembershipsController < ApplicationController
  before_action :set_organisation_membership, only: [:show, :edit, :update, :destroy]

  def index
    @organisation_memberships = OrganisationMembership.all
  end

  def show
  end

  def new
    @organisation_membership = OrganisationMembership.new
  end

  def create
    @organisation_membership = OrganisationMembership.new(organisation_membership_params)

    if @organisation_membership.save
      redirect_to @organisation_membership, notice: 'Organisation membership was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @organisation_membership.update(organisation_membership_params)
      redirect_to @organisation_membership, notice: 'Organisation membership was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @organisation_membership.destroy
    redirect_to organisation_memberships_url, notice: 'Organisation membership was successfully destroyed.'
  end

  private
    def set_organisation_membership
      @organisation_membership = OrganisationMembership.find(params[:id])
    end

    def organisation_membership_params
      params.require(:organisation_membership).permit(:user_id, :organisation_id)
    end
end
