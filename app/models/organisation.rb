class Organisation < ApplicationRecord
    has_many :groups
    has_many :memberships
    has_many :users, through: :memberships

    has_one_attached :image
  end
  