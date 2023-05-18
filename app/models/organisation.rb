class Organisation < ApplicationRecord
    has_one_attached :image
    has_many :groups
end
