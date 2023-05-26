class AddFieldsToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :description, :text
    add_column :order_items, :featured, :boolean
    add_column :order_items, :group_assignment_type, :string
    add_column :order_items, :name, :string
    add_column :order_items, :sku, :string
    add_column :order_items, :stocked, :integer
  end
end
