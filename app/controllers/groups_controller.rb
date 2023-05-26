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

  def assign_product
    # You'll need to get the product, location, and group based on your application's context
    product = Product.find(params[:product_id])
    location = Location.find(params[:location_id])
    group = Group.find(params[:group_id])
    assignment_type = params[:assignment_type]  # This should be 'mandatory' or 'recommended'
  
    ProductAssignment.create(product: product, location: location, group: group, assignment_type: assignment_type)
  end

  def change_product_assignment
    # You'll need to get the product, location, and group based on your application's context
    product = Product.find(params[:product_id])
    location = Location.find(params[:location_id])
    group = Group.find(params[:group_id])
    assignment_type = params[:assignment_type]  # This should be 'mandatory' or 'recommended'
  
    assignment = ProductAssignment.find_by(product: product, location: location, group: group)
    assignment.update(assignment_type: assignment_type)
  
    # If you're changing the location:
    new_location = Location.find(params[:new_location_id])
    assignment.update(location: new_location)
  end
  

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :organisation_id)
    end
end
