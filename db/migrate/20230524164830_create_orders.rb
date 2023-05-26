class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.decimal :total_price
      t.string :status
      t.references :location, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :payment_method
      t.string :payment_status

      t.timestamps
    end
  end
end
