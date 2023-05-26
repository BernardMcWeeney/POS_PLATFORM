class AddAssignmentTypeToProductAssignments < ActiveRecord::Migration[7.0]
  def change
    add_column :product_assignments, :assignment_type, :string
  end
end
