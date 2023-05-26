class CreateProductAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :product_assignments do |t|

      t.timestamps
    end
  end
end
