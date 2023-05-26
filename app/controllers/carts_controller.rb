class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  private

  def set_cart
    @cart = current_user.cart_for_location(current_location)
  end
end
