class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :organisation
  validates :user_id, uniqueness: { scope: [:organisation_id, :group_id], message: "has already joined this organisation/group" }
end