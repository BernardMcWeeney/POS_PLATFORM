class Location < ApplicationRecord
  belongs_to :group
  belongs_to :organisation

  has_many :location_memberships
  has_many :users, through: :location_memberships

  has_many :carts
  has_many :orders
  has_many :product_assignments
end
