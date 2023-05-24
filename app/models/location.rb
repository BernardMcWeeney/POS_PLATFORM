class Location < ApplicationRecord
  belongs_to :group
  belongs_to :organisation
end
