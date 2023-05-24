class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  
  def index
    @memberships = Membership.all
  end
  
  
  def show
    @group = @membership.group
    @organisation = @group.organisation if @group
  end
  
  

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = params[:membership][:user_id]
    @membership.organisation_id = Group.find(params[:membership][:group_id]).organisation_id
  
    if @membership.save
      redirect_to @membership, notice: 'Membership was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @membership.update(membership_params)
      redirect_to @membership, notice: 'Membership was successfully updated.'
    else
      puts "Update failed"
      puts @membership.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @membership.destroy
    redirect_to memberships_url, notice: 'Membership was successfully destroyed.'
  end

  private
  
  def set_membership
    @membership = Membership.find(params[:id])
  end

  def membership_params
    params.require(:membership).permit(:organisation_id, :group_id, :user_id)
  end  
end
