class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
  
    def index
      @orders = Order.all
    end
  
    def show
      @order_items = @order.order_items
    end
  
    def new
      @order = Order.new
    end
  
    def create
      @order = Order.new(order_params)
  
      # Copy all items from the current cart to the new order
      current_cart = Cart.find_by(user: current_user, store: current_store)
      current_cart.cart_items.each do |cart_item|
        @order.order_items.build(
          product_id: cart_item.product_id,
          quantity: cart_item.quantity,
          price: cart_item.price,
          tax: cart_item.tax
        )
      end
  
      if @order.save
        # Clear the cart
        current_cart.cart_items.destroy_all
  
        # Create a new cart for the next customer
        current_user.carts.create(store: current_store)
  
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render :new
      end
    end
  
    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_order
      @order = Order.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:user_id, :location_id)
    end
  end