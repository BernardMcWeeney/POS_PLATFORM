class Organisation < ApplicationRecord
  has_many :groups
  has_many :organisation_memberships
  has_many :users, through: :organisation_memberships

  has_one_attached :image
end
  