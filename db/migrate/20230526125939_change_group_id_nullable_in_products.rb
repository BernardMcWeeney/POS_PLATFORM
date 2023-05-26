class ChangeGroupIdNullableInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :group_id, true
  end
end
