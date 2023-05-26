class RenameStatusColumnInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :status, :product_status
  end
end
