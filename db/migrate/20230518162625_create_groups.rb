class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :image
      t.references :organisation, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
