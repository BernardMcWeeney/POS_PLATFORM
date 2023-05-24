class CreateLocationMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :location_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
