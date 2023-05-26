class AddTaxToCartItemsAndOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :tax, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :order_items, :tax, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
