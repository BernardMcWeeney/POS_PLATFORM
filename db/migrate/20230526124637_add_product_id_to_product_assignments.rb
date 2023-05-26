class AddProductIdToProductAssignments < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_assignments, :product, null: false, foreign_key: true
  end
end
