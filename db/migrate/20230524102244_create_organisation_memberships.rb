class CreateOrganisationMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :organisation_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
    add_index :organisation_memberships, [:user_id, :organisation_id], unique: true
  end
end
