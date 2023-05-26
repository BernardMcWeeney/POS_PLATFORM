class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  
    def index
        @products = Product.joins(:product_assignments).where(product_assignments: { location_id: current_location.id })
    end
      
    def show
    end
  
    def new
      @product = Product.new
    end
  
    def edit
    end
  
    def create
        @product = Product.new(product_params.merge(product_status: :published))
        @product.location_id = current_location.id
        respond_to do |format|
          if @product.save
            ProductAssignment.create(product: @product, location: current_location, assignment_type: 'Mandatory')  # create ProductAssignment here
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
    end
      
      
  
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
        if @product.destroy
          ProductAssignment.where(product: @product, location: current_location).destroy_all
          respond_to do |format|
            format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
            format.json { head :no_content }
          end
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
    end
      
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :price, :location_id)
    end
  end
  