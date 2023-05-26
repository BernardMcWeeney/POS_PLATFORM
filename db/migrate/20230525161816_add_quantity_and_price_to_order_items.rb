# db/migrate/20230525161101_add_quantity_and_price_to_order_items.rb
class AddQuantityAndPriceToOrderItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :order_items, :quantity, false
    change_column_null :order_items, :price, false
  end
end
