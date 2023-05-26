class CartItemsController < ApplicationController
    before_action :set_cart
  
    def create
      @cart_item = @cart.cart_items.new(cart_item_params)
      @cart_item.price = @cart_item.product.price
      @cart_item.tax = @cart_item.product.price * 0.10 # Assuming a tax rate of 10%
      @cart_item.total = (@cart_item.price + @cart_item.tax) * @cart_item.quantity
      if @cart_item.save
        @cart.calculate_total
        redirect_to @cart, notice: 'Product added to cart.'
      else
        render :new
      end
    end

    def edit
        @cart_item = CartItem.find(params[:id])
    end
  
    def update
      @cart_item = @cart.cart_items.find(params[:id])
      if @cart_item.update(cart_item_params)
        @cart.calculate_total
        redirect_to cart_path(@cart), notice: 'Cart updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.destroy
      @cart.calculate_total
      redirect_to cart_path(@cart), notice: 'Item removed from cart.'
    end
  
    private
  
    def set_cart
      @cart = current_user.cart_for_location(current_location)
    end
  
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :product_id)
    end
      
  
    def calculate_tax(price)
      # Implement your tax calculation logic here
    end
  end
  