class AddFieldsToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :description, :text
    add_column :cart_items, :featured, :boolean
    add_column :cart_items, :group_assignment_type, :string
    add_column :cart_items, :name, :string
    add_column :cart_items, :price, :decimal
    add_column :cart_items, :sku, :string
    add_column :cart_items, :stocked, :integer
  end
end
