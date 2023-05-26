class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.decimal :total
      t.decimal :tax
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.integer :cart_number

      t.timestamps
    end
  end
end
