class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :user_id, uniqueness: { scope: :group_id, message: "has already joined this group" }
end
