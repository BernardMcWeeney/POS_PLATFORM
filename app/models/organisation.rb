class Organisation < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :groups

    has_one_attached :image
  end
  