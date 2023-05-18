class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :address
      t.string :owner
      t.string :image
      t.text :web_links

      t.timestamps
    end
  end
end
