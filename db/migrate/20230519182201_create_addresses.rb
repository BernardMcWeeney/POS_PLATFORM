class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :post_town
      t.string :county
      t.string :eircode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
