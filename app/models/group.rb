class Group < ApplicationRecord
  belongs_to :organisation
  has_many :memberships
  has_many :users, through: :memberships
end
