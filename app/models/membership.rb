class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :organisation
end
