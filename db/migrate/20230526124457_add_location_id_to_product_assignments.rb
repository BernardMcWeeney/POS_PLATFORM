class AddLocationIdToProductAssignments < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_assignments, :location, null: false, foreign_key: true
  end
end
