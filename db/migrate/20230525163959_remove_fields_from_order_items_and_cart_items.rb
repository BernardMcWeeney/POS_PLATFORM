class RemoveFieldsFromOrderItemsAndCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :featured, :boolean
    remove_column :order_items, :group_assignment_type, :string
    remove_column :order_items, :stocked, :integer

    remove_column :cart_items, :featured, :boolean
    remove_column :cart_items, :group_assignment_type, :string
    remove_column :cart_items, :stocked, :integer
  end
end
