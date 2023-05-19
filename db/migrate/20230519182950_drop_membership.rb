class DropMembership < ActiveRecord::Migration[7.0]
  def up
    drop_table :memberships
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
