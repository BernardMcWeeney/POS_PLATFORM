class GroupMembershipsController < ApplicationController
  before_action :set_group_membership, only: [:show, :edit, :update, :destroy]

  def index
    @group_memberships = GroupMembership.all
  end

  def show
  end

  def new
    @group_membership = GroupMembership.new
  end

  def create
    @group_membership = GroupMembership.new(group_membership_params)

    if @group_membership.save
      redirect_to @group_membership, notice: 'Group membership was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group_membership.update(group_membership_params)
      redirect_to @group_membership, notice: 'Group membership was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group_membership.destroy
    redirect_to group_memberships_url, notice: 'Group membership was successfully destroyed.'
  end

  private
    def set_group_membership
      @group_membership = GroupMembership.find(params[:id])
    end

    def group_membership_params
      params.require(:group_membership).permit(:user_id, :group_id)
    end
end
