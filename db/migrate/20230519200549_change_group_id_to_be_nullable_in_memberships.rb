class ChangeGroupIdToBeNullableInMemberships < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memberships, :group_id, true
  end  
end
