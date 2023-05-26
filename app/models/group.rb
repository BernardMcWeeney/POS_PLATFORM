class Group < ApplicationRecord
  belongs_to :organisation
  has_many :locations
  has_many :group_memberships
  has_many :users, through: :group_memberships
  has_many :product_assignments
end
