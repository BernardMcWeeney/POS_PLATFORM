class LocationMembershipsController < ApplicationController
  before_action :set_location_membership, only: [:show, :edit, :update, :destroy]

  def index
    @location_memberships = LocationMembership.all
  end

  def show
  end

  def new
    @location_membership = LocationMembership.new
  end

  def create
    @location_membership = LocationMembership.new(location_membership_params)

    if @location_membership.save
      redirect_to @location_membership, notice: 'Location membership was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location_membership.update(location_membership_params)
      redirect_to @location_membership, notice: 'Location membership was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @location_membership.destroy
    redirect_to location_memberships_url, notice: 'Location membership was successfully destroyed.'
  end

  private
    def set_location_membership
      @location_membership = LocationMembership.find(params[:id])
    end

    def location_membership_params
      params.require(:location_membership).permit(:user_id, :location_id)
    end
end
