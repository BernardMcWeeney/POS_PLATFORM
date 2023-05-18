class Group < ApplicationRecord
  has_many :users
  belongs_to :organisation

end
