class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
    @organisations = Organisation.all
  end

  def edit
    @organisations = Organisation.all
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update
    #authorize @group
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    #authorize @group
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :organisation_id)
    end
end
